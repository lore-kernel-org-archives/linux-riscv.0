Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC49C982FA
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 21:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MsyWjUC7mLGl5a8KsBV7C8oMVYiv9A/3sxM63t9YXw=; b=HOKIeHps//JELJ
	7rBRsq6GMDFcqFNQavzjOLoheTWsFgr5qZ3+Rg10yIeFdJ6vpAZ6viGNfYPYxTlaR+Ga/qOdEU3RH
	A+aAjAs1mpYGEiaeVFQSES0n0ETvbyWS9dQg2AudL9/DP97UG8iGJVShA8lXjojgS2KKsU1CeqFQ9
	8wws8ffMuOUYI0CTpj0qlREp58GrKtHyOBQkcMTfDpGmVOi6Az0BPHiAAQ0qDs7cFZ31GhlUcnvQ1
	0FaWS3iEnXQrSx35LdgwVLdyqhbbYOiZyoScRzt6BrumcF5Oe/842xBH/kfNU5ouABDzcx7FJV9am
	C5EzThI7GRQguVa1w2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x987k-00000006cb0-3c7B;
	Tue, 22 Sep 2026 21:34:00 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x987g-00000006caC-1ZEF
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 21:33:58 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4ab201f9so302733d50.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790112835; x=1790717635; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WeGUBMLWdKwi5Qro48n5wzE6cYnrkvQSg7+ilGkmexE=;
        b=cJHNZ9LM202UuNlXVgr0mNUK5XkZElkJkFeN5BQce1tSJ8YfbBhGO1OB/AHLUsBET+
         4mtQ/8mk2jla2x+H2qPcZT+qsIUdl2pU8nQSLFudZVTTCp94aLiq0rBZ2Xly87y9slGZ
         QsoDBrFF5tVkY2v22ciVlhyoSCsYbGZME7QyDrSWA6lhytwnWbjSgfre6+RvSkLHgwMW
         CUvusDzsKqv64oGvOfN2SylMlJ8XKmTV4rFnLjDW+8thtRb9sTsSfTcAvow3FvY3/cUR
         CAMRqbz7Wkdy6F1QAot7zm4x/5svTR/cY9iiLBuUPE5C7Co76SRcmIgxNhMpDxHrGIZk
         Lubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790112835; x=1790717635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WeGUBMLWdKwi5Qro48n5wzE6cYnrkvQSg7+ilGkmexE=;
        b=leLUnAAEARc8r0mQppWAYgsQdslHdG6fw/tpDzux1NiemT+4OxaLGulactzTHrLAlU
         J18ZaHyzznB0/h7n2JLOw8/qp31pwmiRXsMd5z1CGLZnRC78VB5eMHKDeO4iMSvdaNmo
         /TLLxEW5d/6F1dT1nCtOaXzHlGrO1xKJop+w+T7dCx26Jdna9H8N23/bP+lBPDplcrXS
         +JEHlEzTCPyLmkIdNT5apKSpZRXwiTyyej0E3DYy8C4qfUBatzBfnUeBq/qnUCUUULDg
         8yDCfZOLJY/QxBB2lVAggztvO3xUElk4DKFwHb/8fH563t7wqpVNdCqC+d5NDFajVMNZ
         /Wgg==
X-Forwarded-Encrypted: i=1; AKwUvBykavZ91rxsCgbDYzWnFrdgjVderSYlCNo0pTi6WtkGacEYKqt8V6sq1IMoBy9j8M6m58DhDCAc2ZawJw==@lists.infradead.org
X-Gm-Message-State: AFuF++mKe6layOyxoBPh6Q08kHRfG4tbwwUNsi7qt5ySQbpR1mv/OPqg
	lyvyEJNmRiQgrEPeOTjHOOpw0fAxhII9gsU5VGq/MfcRr0R/nldINI+sOHxdCdz90KA=
X-Gm-Gg: AYBFou1F8bx03l/ZqSVvuAQjl7SmaqhdlvKCnOy+Ij49kGyJSsJzO7PE0k4NdVDfCu3
	ieck+yWcJiMIJaiG/tRAIqSwMKYT624vfTvT3P7l+R2lvOEMN350NAov+PyLF4pjnQx1I1S54cx
	Y9f/hnsmhcDF+3qE3eQLmk8lY42UHhTvwVVFESYsYfn4FYO1Xu+M0cC+5e/amuMCDrKFytFZg7a
	pZe/16ewX3WeiEMb3Jti+nDKS5nqxsCG8jVro4llBnMawSYv3ydxpkPjdPdVo2e/NvGoQo2+iP0
	EbyWWP8t6AUm6TKICqZd8HvhoYRqkg02BSPR8dadQEgTb6luHTcvUev5a0o7Zj66ovxTfK6TcR4
	E/t2L5ZJnlTA/hVU9/ue19RMKVpB15TJUodrY+LGioxqfWUhzUi9IGJXdbUxoI2SzkUxHsJ1Q6C
	frrWEWxW/L2te7AycxC4h3jKyQ40B68QMiLP3V9+miFOY28o7CxE/4UUjcE2nL9Olp0kpn7vVW5
	BQfx7XKsQ==
X-Received: by 2002:a05:690e:1383:b0:672:d326:d31e with SMTP id 956f58d0204a3-672d578465fmr383171d50.44.1790112834519;
        Tue, 22 Sep 2026 14:33:54 -0700 (PDT)
Received: from localhost ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a466bc81a6sm2551187b3.46.2026.09.22.14.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:33:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:33:52 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <arL0QBe_XYLO8Yy7@Tao-Chiu's-Mac>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqGNGp8PInSV4vty@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_143357_341335_A36C1CFD 
X-CRM114-Status: GOOD (  47.62  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Aurelien,

Sorry for replying late. I did run a compilation test with vectorized
glibc in qemu after seeing this thread shortly, but then focus on
something else as it didn't catch any corruption we've seen here.

On Wed, Sep 09, 2026 at 06:45:14PM +0200, Aurelien Jarno wrote:
> [Added Andy and Karl in Cc: as they have been involved in the vectored =

> user copy code and fighting similar issues]
> =

> Hi,
> =

> Some more progress on that topic.
> =

> On 2026-09-08 06:42, Aurelien Jarno wrote:
> > Dear all,
> > =

> > I have done some small progress on that issue. Help is still wanted and =

> > would be appreciated.
> > =

> > On 2026-08-30 22:52, Aurelien Jarno wrote:
> > > Dear all,
> > > =

> > > For the last weeks, I have been tracking a random memory corruption a=
nd
> > > relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). It =

> > > started upgrading to glibc 2.43, which does memset() through vector =

> > > instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1 =

> > > kernel, but I have also been able to reproduce it with a vanilla 7.2.=
2 =

> > > kernel, using a similar configuration to the Debian kernel. The board =

> > > uses OpenSBI 1.9 and the vendor U-Boot.

The KVM fix, which is in 7.3 now, is irrelavant to this bug (see below),
because the fix targets preemptible kernel-mode vector, but we can
trigger this bug with CONFIG_RISCV_ISA_V_PREEMPTIVE unset. Nontheless,
if we want to test on the latest code, feel free to grab the series at
[3] and boot with riscv_novstateopt to preseve the context poisoning
behavior.

> > =

> > I have been able to rule out OpenSBI from the issue, I have checked =

> > there is not trap top OpenSBI when the problem happens.
> > =

> > > Typically it manifests itself with the following kind of error, when =

> > > running g++ from GCC 16 as part of building software (e.g. OpenJDK, =

> > > Blender, Dolfin, Qt6):   =

> > > =

> > > Assembler messages:
> > > {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
> > > {standard input}:284588: Error: unrecognized opcode `=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=FF=
=FF=FF=FF=FFvl874'
> > > =

> > > The broken chars are 0xff and it seems there are always 240 (but with =

> > > poor statistics). Sometimes it instead causes a GCC ICE instead.
> > =

> > I have identified that the 0xff comes from the poisoning done for v0 in
> > __riscv_v_vstate_discard(), which should only happen for a syscall. =

> > Indeed changing the value to different ones propagates to the above =

> > error message.
> > =

> > Furthermore I have found that changing CONFIG_RISCV_ISA_V_PREEMPTIVE =

> > doesn't change anything, and that changing RISCV_ISA_V_UCOPY_THRESHOLD =

> > changes the number of broken bytes.

Turnning off CONFIG_RISCV_ISA_V_PREEMPTIVE makes the ucopy fall back to
the scalar copy on a page fault, because faulthandler_disabled() would
return true after kernel_vector_begin(). So if we are suspecting a
corruption at vector restart, then it is not, there is no restarting of
such instruction.

The only possible way to have a restarted vector ld/st here under
!CONFIG_RISCV_ISA_V_PREEMPTIVE is then an irq restart. I don't know if
you test this code with !CONFIG_RISCV_ISA_V_PREEMPTIVE **and** with
irqs_disabled() =3D=3D true in the user copy code. If we still observed
a corruption under this case, then it suggests that the corruption
happens even eariler. It is then either the faulting instruction itself,
or the corruption happens even eariler.

> =

> The values from __riscv_v_vstate_discard() end-up there because they are =

> the last values written to the vector registers. I have added some =

> poisoning in __asm_vector_usercopy_sum_enabled before the loop, and =

> those values appear instead. Using different values per vector register, =


Do you know what is the address of corrupted data? If it always starts at
a page boundary (e.g offset 0x00000 for THP) then it suggests a strong
correlation with fault handling.

> I have found that the corruption comes from a partial load of the vle8.v =

> instruction, while the result of the poisoning and the partial load are
> then both written by the vse8.v:
> =

>  loop:
>         vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
>         fixup vle8.v vData, (pSrc), 10f
>         sub iNum, iNum, iVL
>         add pSrc, pSrc, iVL
>         fixup vse8.v vData, (pDst), 11f
>         add pDst, pDst, iVL
>         bnez iNum, loop
> =

> One hypothesis could be that for some reason, an exception (page table =

> fault, irq, ...), the vle8.v instruction is interrupted, and only =

> partially loads the vector register from memory. This stops at a 16-byte =

> boundary (at least on the K1), and the remaining part of the v0-v7 =

> register is left with the previous value (with the original kernel that =

> is the poisoning done in __riscv_v_vstate_discard). In theory when the =

> instruction is interrupted, vstart is set to a non-zero value (for =

> instance 16), and it should get re-executed after the exception. In =

> practice, in some very rare cases, it doesn't happen and the next =

> executed instruction is the following sub.
> =

> That said with exceptions and vector context switches, the explanation =

> is likely way more complex. [1] gives a possible different scenario, =

> involving an interrupt or a fault between the vsetvli and vle8.v/vse8.v =

> instructions. However it doesn't fix the issue, neither patch [2]
> (in that case tested with CONFIG_RISCV_ISA_V_PREEMPTIVE=3Dy).
> =

> =

> > Disabling the vectored user code entirely with the following patch seems
> > to prevent the issue (or make it sufficiently rare that I have not =

> > encountered it):
> =

> A much better way to do that is setting RISCV_ISA_V_UCOPY_THRESHOLD=3D-1.=
  =

> =

> I also tried the same kernel on a K3, and it appears to improve =

> stability, getting rid of issues that I attributed to thermal issues.  =

> (due to the absence of fan driver, I run the fan as a fixed speed =

> ~4000rpm). The symptoms are however quite different, it's GCC crashes =

> with "The bug is not reproducible, so it is likely a hardware or OS =

> problem.".
> =

> Regards
> Aurelien
> =

> [1] https://lore.kernel.org/20260806193241.10552-1-kmehltretter@gmail.com/
> [2] https://lore.kernel.org/all/20260810172255.1532787-2-tchiu@tenstorren=
t.com/
> =


[3] https://lore.kernel.org/all/20260918215154.2481482-1-tchiu@tenstorrent.=
com/

> -- =

> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
