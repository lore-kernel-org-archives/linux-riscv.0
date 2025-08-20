Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A9BCA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JSKKaQJ91euR7bW4YMSSQE74CL0Ih+s87Fg5cVWxU8=; b=dUODv4v5R0i2LR
	GVc5K5P0+MhToBp9UYfuj3lpTMYupj/dFqAEQ2NuNa3SEEMMQG2l/aGLW/ByDPDRMuDRch86R3WUc
	Jfez3iMnoBovSskbj5BOyhdFgaYUJWmgfXmWbHcwofY5Kt51/g/YMKpLDw6RzPy1ja6YGvrd5PJ16
	zJChcT5SnUvYXTgou5HjcCg2ZlrrjTaPtDQXanumy36u7WDNsa87Hj/Tnl613GoSKiDKEPOhTPZwQ
	w/s5Qs3C/FHLxTAuPrsxOY1OTIRsOrs0DRTdxIQyEi1AkJOkTu6aulzkuBt2J2yJo/4jmyIYvokEe
	k85dQiloMLNHpi5O1smA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh4X-0000000DQGx-1stJ;
	Wed, 20 Aug 2025 11:33:41 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogAl-0000000DBjR-1COr
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 10:36:04 +0000
X-UUID: 744871e27db111f0b29709d653e92f7d-20250820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:1cb5ba09-da8d-4e80-90ab-8a047c07187e,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:1cb5ba09-da8d-4e80-90ab-8a047c07187e,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:8bfd02a35658c3b6214171ca5bbacc6a,BulkI
	D:250820145207GW1MRF9C,BulkQuantity:7,Recheck:0,SF:17|19|24|44|64|66|78|80
	|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,B
	ulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:
	0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 744871e27db111f0b29709d653e92f7d-20250820
X-User: duanchenghao@kylinos.cn
Received: from localhost [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <duanchenghao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1900494786; Wed, 20 Aug 2025 18:35:56 +0800
Date: Wed, 20 Aug 2025 18:35:30 +0800
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
Message-ID: <20250820103530.GA1475460@chenghao-pc>
References: <20250820062520.846720-1-duanchenghao@kylinos.cn>
 <8b836b6e-103a-41c2-b111-0417d8db4dce@huawei.com>
 <20250820092628.GA1289807@chenghao-pc>
 <239193b7-7dab-45b0-ab13-06bfe3f96f22@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <239193b7-7dab-45b0-ab13-06bfe3f96f22@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_033603_654361_01D4E322 
X-CRM114-Status: GOOD (  24.19  )
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

On Wed, Aug 20, 2025 at 06:10:07PM +0800, Pu Lehui wrote:
> 
> 
> On 2025/8/20 17:26, Chenghao Duan wrote:
> > On Wed, Aug 20, 2025 at 02:52:01PM +0800, Pu Lehui wrote:
> > > 
> > > 
> > > On 2025/8/20 14:25, Chenghao Duan wrote:
> > > > In __arch_prepare_bpf_trampoline(), retval_off is only meaningful when
> > > > save_ret is true, so the current logic is correct. However, in the
> > > 
> > > lgtm, and same for `ip_off`, pls patch it together.
> > 
> > I also checked at the time that ip_off is only initialized and assigned
> > when flags & BPF_TRAMP_F_IP_ARG is true. However, I noticed that the use
> > of ip_off also requires this condition, so the compiler did not issue a
> > warning.
> > 
> > Chenghao
> > 
> > > 
> > > > original logic, retval_off is only initialized under certain
> 
> Can you show how to replay this warning? I guess the warning path is as
> follow. Compiler didn't know fmod_ret prog need BPF_TRAMP_F_CALL_ORIG.
> 
> ```
> if (fmod_ret->nr_links) {
> 	...
> 	emit_sd(RV_REG_FP, -retval_off, RV_REG_ZERO, ctx);
> }
> ```
> 

Exactly, the compiler sees the unconditional use of retval_off.

Chenghao

> > > > conditions, which may cause a build warning.
> > > > 
> > > > So initialize retval_off unconditionally to fix it.
> > > > 
> > > > Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> > > > ---
> > > >    arch/riscv/net/bpf_jit_comp64.c | 5 ++---
> > > >    1 file changed, 2 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> > > > index 10e01ff06312..49bbda8372b0 100644
> > > > --- a/arch/riscv/net/bpf_jit_comp64.c
> > > > +++ b/arch/riscv/net/bpf_jit_comp64.c
> > > > @@ -1079,10 +1079,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
> > > >    	stack_size += 16;
> > > >    	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
> > > > -	if (save_ret) {
> > > > +	if (save_ret)
> > > >    		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
> > > > -		retval_off = stack_size;
> > > > -	}
> > > > +	retval_off = stack_size;
> > > >    	stack_size += nr_arg_slots * 8;
> > > >    	args_off = stack_size;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
