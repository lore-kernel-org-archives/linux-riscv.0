Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0559CA0EFF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 04:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InTwKmU4Fh9P9LC3TAvP2Wsjq4FuZkWgN3Leh7gzpv0=; b=AB5clB5pHlDyOs
	Hz3+xUuzODc4lFw7pOMMbVdSLW2YBDTG6T0drIf3fw3kHuzu43aVRovO/OFEl0WPTrk2wVMSue41H
	CgvohwmpEwSQF7T12RwJ4EyGvN7ge1L/TIImInfs9qS/xmoGxcb4bWKjTOeZ8qkzkDQ92a5vQU+kr
	wfIIZh0fbeRwPRO24bvkU62eCs+WwjuxxkoVHWANwGoH7OTkbm9DtIRAAhZZBHUaPgjbLLJfaG+mT
	/KoTGU2cPXsDLUBEGVUSfSWS5MLsbKkTlmxSvvrgwLBJbF8Xnd33qS13O4nThvJWxF3zhAtDzNyzj
	JtuPb3GNyHm/0N7OBQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxER-0000000FpCE-0HO5;
	Thu, 21 Aug 2025 04:48:59 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovSr-0000000FZvS-3rGG
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 02:55:47 +0000
X-UUID: 4fcfd56a7e3a11f0b29709d653e92f7d-20250821
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:31331416-7b38-4d16-a261-b0cb1ce5c005,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:33274ee4927d2cea1b83a9d1f9bfd892,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4fcfd56a7e3a11f0b29709d653e92f7d-20250821
X-User: duanchenghao@kylinos.cn
Received: from localhost [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 519076177; Thu, 21 Aug 2025 10:55:36 +0800
Date: Thu, 21 Aug 2025 10:55:32 +0800
From: Chenghao Duan <duanchenghao@kylinos.cn>
To: Pu Lehui <pulehui@huawei.com>
Cc: ast@kernel.org, bjorn@kernel.org, puranjay@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
	haoluo@google.com, jolsa@kernel.org, alex@ghiti.fr,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: bpf: Fix uninitialized symbol 'retval_off'
Message-ID: <20250821025532.GA287128@chenghao-pc>
References: <20250820062520.846720-1-duanchenghao@kylinos.cn>
 <8b836b6e-103a-41c2-b111-0417d8db4dce@huawei.com>
 <20250820092628.GA1289807@chenghao-pc>
 <239193b7-7dab-45b0-ab13-06bfe3f96f22@huawei.com>
 <20250820103530.GA1475460@chenghao-pc>
 <9cbdefd6-a757-44b3-a1db-69ca8117aacb@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cbdefd6-a757-44b3-a1db-69ca8117aacb@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_195546_291036_0BFD674F 
X-CRM114-Status: GOOD (  27.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 21, 2025 at 09:58:20AM +0800, Pu Lehui wrote:
> 
> 
> On 2025/8/20 18:35, Chenghao Duan wrote:
> > On Wed, Aug 20, 2025 at 06:10:07PM +0800, Pu Lehui wrote:
> > > 
> > > 
> > > On 2025/8/20 17:26, Chenghao Duan wrote:
> > > > On Wed, Aug 20, 2025 at 02:52:01PM +0800, Pu Lehui wrote:
> > > > > 
> > > > > 
> > > > > On 2025/8/20 14:25, Chenghao Duan wrote:
> > > > > > In __arch_prepare_bpf_trampoline(), retval_off is only meaningful when
> > > > > > save_ret is true, so the current logic is correct. However, in the
> 
> OK, I think we should make commit msg more explicit. Such like the follow.
> wdyt?
> 
> `However, in the fmod_ret logic, the compiler is not aware that the flags of
> the fmod_ret prog have set BPF_TRAMP_F_CALL_ORIG, resulting in an
> uninitialized symbol compilation warning.`
> 

Good idea

> > > > > 
> > > > > lgtm, and same for `ip_off`, pls patch it together.
> > > > 
> > > > I also checked at the time that ip_off is only initialized and assigned
> > > > when flags & BPF_TRAMP_F_IP_ARG is true. However, I noticed that the use
> > > > of ip_off also requires this condition, so the compiler did not issue a
> > > > warning.
> > > > 
> > > > Chenghao
> > > > 
> > > > > 
> > > > > > original logic, retval_off is only initialized under certain
> > > 
> > > Can you show how to replay this warning? I guess the warning path is as
> > > follow. Compiler didn't know fmod_ret prog need BPF_TRAMP_F_CALL_ORIG.
> > > 
> > > ```
> > > if (fmod_ret->nr_links) {
> > > 	...
> > > 	emit_sd(RV_REG_FP, -retval_off, RV_REG_ZERO, ctx);
> > > }
> > > ```
> > > 
> > 
> > Exactly, the compiler sees the unconditional use of retval_off.
> > 
> > Chenghao
> > 
> > > > > > conditions, which may cause a build warning.
> > > > > > 
> > > > > > So initialize retval_off unconditionally to fix it.
> > > > > > 
> > > > > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > > > > ---
> > > > > >     arch/riscv/net/bpf_jit_comp64.c | 5 ++---
> > > > > >     1 file changed, 2 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> > > > > > index 10e01ff06312..49bbda8372b0 100644
> > > > > > --- a/arch/riscv/net/bpf_jit_comp64.c
> > > > > > +++ b/arch/riscv/net/bpf_jit_comp64.c
> > > > > > @@ -1079,10 +1079,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> > > > > >     	stack_size += 16;
> > > > > >     	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
> > > > > > -	if (save_ret) {
> > > > > > +	if (save_ret)
> > > > > >     		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
> > > > > > -		retval_off = stack_size;
> > > > > > -	}
> > > > > > +	retval_off = stack_size;
> > > > > >     	stack_size += nr_arg_slots * 8;
> > > > > >     	args_off = stack_size;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
