Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A92C83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=98CuWdaq5g9ZNxZS5v7MefzQxM+qdwqGI8Yt04pED1A=; b=HmnIYqpnwje0rNu9voye3xPUOi
	PLdgmFuZ3JIvBfRdtzDFrDXuATEjc0XvXIdVOFFx7tvFK47SshaSsntI+/KV/qPqmjkkfzV2DKjMz
	Ed+sYelS+Lxypb1pmIfWKsvWA1IiMf5tPbL/EHm6oay1Xfbep/Q74nv+jmxRm3zcC85+7L/gCTf6P
	IgIrB9hX7yrc5kzKq4OJoqQpmr9CAHUyDEIaS+irOeOs5z9kk4/75+bcII7rEt4b0Bbfg4+5zc7NM
	xvwRdguhP5jyFmXhuLkLLmIE+JclaGPpjxOsCI+frSpCiZV+qhmZVOAoTmzEBdJYdAfRI0CeJfakG
	X+6uZpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3tU-000000081rT-0vRA;
	Wed, 16 Jul 2025 15:18:04 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3tQ-000000081qq-40FS
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 15:18:02 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso45569a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752679079; x=1753283879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIjarP2qmIxEUNr1tc1uUPfdZWXV9rUJNqLMiF74jXY=;
        b=FJyA0y+Tu6kzSS+9arG3MwnkHKbkDZ8eV9u9miNTLr76jqtCbtC2vy3swtfLXQqH/f
         5cC1l3XQkwUEFVZUvH8KiRPlAGKFA/JA43p6uKGeQW7fyne0Xu9XWiK4AzUaMpLWBqVr
         X26OtJVf2g1ZKenhjzj01LB5IKrwYf3ACZOgBE3WixCfpQ72BOii6gjBvxWLzm2kNezR
         nlvklhivHhoCy95Ospcju314ft6eHeJNhNdyQUwDqnMdzl9d7UZseamwO9cs8hnXMsEy
         oQtsiJtvhZcpqrte+ddcAHLkI0JI3sFtZV2cDVHEcKHCItAZVOrdVmafgFJJn0IzlRG3
         OQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679079; x=1753283879;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIjarP2qmIxEUNr1tc1uUPfdZWXV9rUJNqLMiF74jXY=;
        b=Igt9Wi2k8M/SGRWW8DLp5Y0RIEAyOoFcIETB/CEzZZMDzO11gvY7bEeOM5j4FGcsH1
         c9rHJmDi135Adwt4jD7ZbZmWJsveor2RZ+IdfQTUp/mpViVaq5oZ594u08h1lompGgtC
         rQkKkaDVVY8D0A0/fv4QrW5aG2oN5TUrP2M0lUoFz/Z3EdlKLW95vdpUTECOoVzU6aR9
         DMyZrWl987rFojfWxR74dBbR/HS1hP9bod/cgwxC4yiWJKj/7b0cHrfN8dbuJhp8pIv1
         56vLLHhiyRGkdw9o5WRTQ86UzlNtt9B83B/TekSbhI8sXRtJIGbJN5eZ2lXLCsyUyUhH
         ef2w==
X-Forwarded-Encrypted: i=1; AJvYcCX/8frSZ4m/cq7qYKD42bEXQIUGSaKHqCcUywIKmjrn7nyd9yKEsCOTBUpsaMyIcTaLBrQAjcUDSv6ntA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBpO6+BG1nQ9sciU7Q47myVmfJ9eRR7PrdTE8CNGqHEGsMTCXn
	lOPLerl1u0KYLFb4MogHzBH1dCCAx55/7KaTLPUj5AHz+T4Pu3TQNgRTOr0RYnlzFuE=
X-Gm-Gg: ASbGncuuZxyzTb46vI5URTlJ4s8alIVtHFhmQ90VvPDpDoTcfuGb30g87Rf4vUmH1Pv
	NYgqGgwg3Qxmn4DHkf+PDRLqCZC51up/xMPslxmOpguZ+lUVM+5n/CVL99DrBEf1/aJ8tr2YGDf
	SsOn77iqDQTwP1E4tO6Wo9WN9/aN7cemR9mbDjTH0ho/ih+ttZts1yk3oDv5N9aZ7xmEQOb9fVt
	kAyyVgWTFe70FlpUr+Z1ut2m0l3+ooVv2rNWASspFhccZLHKLuZ2b4OnX7ZXQJmGZ2THWOoPlEF
	XBZPZMaS7n9PHt4shvHrWrLU1wnF7eZ9C+uf0h+kkqM2sTRIRp1Rqxqh+Un5Ay/B4WQk1zdxGUb
	CffiaEa8GfkqQvxnBVUK4
X-Google-Smtp-Source: AGHT+IGQvipCL8I7Jp/o0kQbtdNtCpkDRd45ElcLm4C7rqFsQkVF1I178icC+V6YopeF2v7qVU9sWg==
X-Received: by 2002:a17:90b:2684:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-31c9f47c7d7mr4052918a91.25.1752679079182;
        Wed, 16 Jul 2025 08:17:59 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:b02a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de4323cd5sm127190795ad.126.2025.07.16.08.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:17:58 -0700 (PDT)
Date: Wed, 16 Jul 2025 08:17:58 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Jul 2025 08:17:56 PDT (-0700)
Subject: Re: [PATCH] riscv: Stop considering R_RISCV_NONE as bad relocations
In-Reply-To: <20250711134909.GA73430@iscas.ac.cn>
CC: alexghiti@rivosinc.com, alexghiti@rivosinc.com, Nelson Chu <nelson@rivosinc.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangjingwei@iscas.ac.cn
Message-ID: <mhng-4C27A130-61EA-4AA5-A2A6-506D0CB22B7B@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_081801_231851_BF435C95 
X-CRM114-Status: GOOD (  38.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 11 Jul 2025 06:49:09 PDT (-0700), wangjingwei@iscas.ac.cn wrote:
> Hi all,
>
> On Thu, Jul 10, 2025 at 11:43:00AM -0700, Palmer Dabbelt wrote:
>> On Thu, 10 Jul 2025 01:34:31 PDT (-0700), alexghiti@rivosinc.com wrote:
>> > Even though those relocations should not be present in the final
>> > vmlinux, there are a lot of them. And since those relocations are
>> > considered "bad", they flood the compilation output which may hide some
>> > legitimate bad relocations.
>> >
>> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> > ---
>> >  arch/riscv/tools/relocs_check.sh | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
>> > index baeb2e7b2290558d696afbc5429d6a3c69ae49e1..742993e6a8cba72c657dd2f8f5dabc4c415e84bd 100755
>> > --- a/arch/riscv/tools/relocs_check.sh
>> > +++ b/arch/riscv/tools/relocs_check.sh
>> > @@ -14,7 +14,9 @@ bad_relocs=$(
>> >  ${srctree}/scripts/relocs_check.sh "$@" |
>> >  	# These relocations are okay
>> >  	#	R_RISCV_RELATIVE
>> > -	grep -F -w -v 'R_RISCV_RELATIVE'
>> > +	#	R_RISCV_NONE
>> > +	grep -F -w -v 'R_RISCV_RELATIVE
>> > +R_RISCV_NONE'
>> >  )
>>
>> I'm not super opposed to it, but is there a way to just warn once or
>> something?  It's probably best to still report something, as there's likely
>> some sort of toolchain issue here.
>>
>
> I think Alexandre's approach is ideal from the kernel's perspective.
> This doesn't really seem to be a bug; I see it more as a case where the
> toolchain's handling of R_RISCV_NONE doesn't quite match the kernel's
> expectations.
>
> I found the large number of R_RISCV_NONE relocs only appear in the final
> vmlinux. The key difference is the kernel build's --emit-relocs flag
> and the *(.rela.text*) directive in vmlinux.lds.S. This combination
> forces all relocation entries, including those marked as R_RISCV_NONE,
> to be written verbatim into the final vmlinux.

Ah, OK, if it's coming from "--emit-relocs" then actually it seems fine.  
So I think this is the right way to go, then.  It's on fixes, should 
show up for Linus later this week.

> I traced this back to BFD's implementation and found that during
> relaxation (e.g., when an auipc+jalr is optimized to a jal), the linker
> modifies the first reloc slot to R_RISCV_JAL and marks the second,
> now-useless slot as R_RISCV_DELETE. In the cleanup phase, to prevent
> reprocessing, BFD then changes the cleaned-up DELETE marker to
> R_RISCV_NONE. This is how, when the kernel specifies --emit-relocs,
> these R_RISCV_NONE markers get preserved in the final .rela.text section.
>
> To truly change this, it seems to depend on whether the binutils
> is willing to add a stage to clean up these harmless but
> useless markers.
>
> If possible, I was thinking we could perhaps iterate and remove the
> R_RISCV_NONE entries from .rela.text before the alignment pass.
>
> But if there's no agreement on the BFD side, Alexandre's approach still
> seems correct and aligns with the psABI, where R_RISCV_NONE has no
> operational meaning.
>
>> Also: if you can reproduce it, Nelson can probably fix it.  I'm CCing him.
>>
>
> Reproducing the issue is simple: you just need a call instruction to
> create a relaxation opportunity, then link with --emit-relocs and a
> linker script that includes *(.rela.text*). :)
>
> For convenience, I've put a minimal, self-contained reproduction case
> here: https://gist.github.com/Jingwiw/762606e1dc3b77c352b394e8c5e846de
>
>> >
>> >  if [ -z "$bad_relocs" ]; then
>>
>
> Reviewed-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
>
> Thanks,
> Jingwei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
