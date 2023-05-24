Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CBBC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1Q2iP/q+M6Q4QhrEvZXgSC2JZA8YmyzbClD9tId2+E=; b=NqMLLoLE5rQtvt
	Xvh0XR5+yNEgl3S4SbzhpE0nR8TzBbjE80H1Cx+E3KImK0wqVsKEge4bbdePiSgZytmH9QQtwSEnx
	e5buvyCJx6QU3B2/txiaw+jPb71C+EhGgoVFB6F68O+0vhfvu4xbDnfzVxS5c8Epx4VMMJ+JHuwif
	bQR3AFn3BBZmT/lu0tG1dQS6LZl1kVNDGC9mDc6WEeCWKQ+BQCE4RdGEeOfWtdzV4Gh9ARNRu5jRh
	g9rn6kDcaOo/AWL9nGIzSGWShgvIuMhazFFO8Iq0lnKBMqlr3xuIbj5taMvDdZsXwTawngV+JzD0A
	VYY2BArnS7Gsw2nCqcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1i3T-00CV7A-2U;
	Wed, 24 May 2023 06:33:03 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1i3Q-00CV6Y-1g;
	Wed, 24 May 2023 06:33:02 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 4671A580830;
	Wed, 24 May 2023 02:32:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 24 May 2023 02:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684909979; x=1684917179; bh=iE
	vC5oFb9XN9Ny/ckJJEpZR1s1u4bGw5GWvEik8MIaQ=; b=Sy80HQChHvwFouPhTf
	5VO0zWc1S5LnUqkyLXDevy/PenOZIjSJRiG6aMaAL5AvpCGhns0tX0uts+pG0sOm
	qrZ0akU0JntTTnJO8WzEbTs9eYFbm8RYmrMLMXs8M9rIUGdT/Y1k1IrGgBmw9azD
	bdFlj5uw6f4m3EagNTlI/7ACW+5MGLJ6CfPUR/o+Zd+NN6zyiY1aOsarlUProsGB
	zE1FXaaIQpLL7WCycGAM4QaHpB61vioS15IlPawLpUwd151TKgq897XwlC59yj/0
	D73V4RwoR6v3QyPi8FRFrZYq/+E2SlSE04SYEH/MY84KRVq7Pers8GZihnPEtu1M
	P2Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684909979; x=1684917179; bh=iEvC5oFb9XN9N
	y/ckJJEpZR1s1u4bGw5GWvEik8MIaQ=; b=QgaeFTYjDe/aE3UEmYQIdaa6iQYPe
	LwZMi5ZIYq5du2p50bu8RwdfOa4hZWuQJQty3AGhWDmWUvAyPkP7TGcT+cQcH7Ft
	9wxcxX7Nhx6NWVfLSq++rS2LklRz200cqlcjTX5ePnFKvbahCO/d/WQe98JbaKcv
	5hnEFe+KIlctHuOz9ZnCdK05j0AZdN/deDPUOcLPasG0b8lMAoD3Wf+0cO3B694Y
	3x+jyo33gjSGRsMEsD0F1R4L+ZFcaaEM89W0RvIRF+L9g8GzDhJT9e8TMLjy82d4
	u+bjiEu17v/ZyE8t8vGbDKqY9dm0SnLnZMuvN6/PiH1V6K3z4z25gIYOg==
X-ME-Sender: <xms:ma9tZNkYK_kDGZ5BZ1yvB1_zfZzf1Hzwh0pXdMi_zdil7WU-FhUCLw>
    <xme:ma9tZI2mri10JBBBvKYj_aSBV0vT8_ztbeHMfb4dZPhzUfISKFNQgobOnXHEO3diy
    ZWZWNtucLBneNwhHak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeekheetgfduvdeljedvieelieffhfeuveegvdehieduhfeuvefgheekieet
    udekkeenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdgu
    vg
X-ME-Proxy: <xmx:ma9tZDrwWySbjDunWcTW-O7b6HxyX7OhQRm2OCAOKFF7JLFgeLKAEw>
    <xmx:ma9tZNnQVBvuKSn_3q4MYquDy67rcVDq1F3jTh3d93wvhcwfpVxLYw>
    <xmx:ma9tZL2mD8kCBEnH1FsIH5XgnC0oapgQEgFiYf4-v91uDGc_et1ovw>
    <xmx:m69tZA40O-cv_hWzAZ7QvFwLrRtWGwdMzqshbfB7_kLz_J0N6n-WmQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 55B9DB60086; Wed, 24 May 2023 02:32:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <eb61b8c5-4c0a-4d64-b817-235db848995c@app.fastmail.com>
In-Reply-To: <mhng-f92fa24d-c8bd-4794-819d-7563c1193430@palmer-ri-x1c9a>
References: <mhng-f92fa24d-c8bd-4794-819d-7563c1193430@palmer-ri-x1c9a>
Date: Wed, 24 May 2023 08:32:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Palmer Dabbelt" <palmer@dabbelt.com>, "Andy Chiu" <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, "Vineet Gupta" <vineetg@rivosinc.com>,
 "Greentime Hu" <greentime.hu@sifive.com>,
 "Guo Ren" <guoren@linux.alibaba.com>,
 "Vincent Chen" <vincent.chen@sifive.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Kees Cook" <keescook@chromium.org>, heiko.stuebner@vrull.eu,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Janosch Frank" <frankja@linux.ibm.com>,
 "Qing Zhang" <zhangqing@loongson.cn>, eb@emlix.com
Subject: Re: [PATCH -next v20 12/26] riscv: Add ptrace vector support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_233300_645593_374B4ED4 
X-CRM114-Status: GOOD (  11.73  )
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

On Wed, May 24, 2023, at 02:49, Palmer Dabbelt wrote:
> On Thu, 18 May 2023 09:19:35 PDT (-0700), andy.chiu@sifive.com wrote:

>>  static const struct user_regset_view riscv_user_native_view = {
>> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
>> index ac3da855fb19..7d8d9ae36615 100644
>> --- a/include/uapi/linux/elf.h
>> +++ b/include/uapi/linux/elf.h
>> @@ -440,6 +440,7 @@ typedef struct elf64_shdr {
>>  #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>>  #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
>> +#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
>
> IIUC we're OK to define note types here, as they're all sub-types of the 
> "LINUX" note as per the comment?  I'm not entirely sure, though.
>
> Maybe Arnd knows?

No idea. It looks like glibc has the master copy of this file[1], and
they pull in changes from the kernel version, so it's probably fine,
but I don't know if that's the way it's intended to go.

     Arnd

[1] https://sourceware.org/git/?p=glibc.git;a=history;f=elf/elf.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
