Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BF4C55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 02:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFTsgi/CAl4Psg1C/L1kaiUMdizUNFkvLAskrmKFLlk=; b=PXPQrDb8jiNwJA
	UamZsdKi/m2PeVPAP5Y/97Og/CB72FZI7TglJJwAObkV/Fbl6k//w44gbKfd1O6E1X9WoYU2Dx+db
	1a0jehNAqgB23pUn8sUvS8b7lKxlM5h//+fBIgYOy65ovAmYuVlRdoQNyWr8mXwEG6Sfz6+0s46SL
	IM/J0bXIpSp+G/FCDLKuV86oa72ON8u6aPZqN+1y2vmf7qyQ8+29PU3A1Xbsx6aeNddaAZlMUYouw
	OXYclrjYtM9HIUs8vcd4Mgeb40GR1XqAPOtyOERXu1eeRKs9uDj41Vq75LFtg/h7OPqLUbMnvcR7a
	SFk8LiEZPw4D6zVZ1cpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Cu-00000000s0S-1rk5;
	Tue, 04 Aug 2026 02:48:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Cr-00000000rzY-1L5B
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 02:48:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ceaf8a1265so48600205ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 19:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785811720; x=1786416520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uu48l08iOiq9g5Bc53dhkabEeR0zOJy6W3JS0tzyMbo=;
        b=o2K8CUezVV8PtqsLEpB2nk+qVbaWMt1RGSTC2WoArqRY+/dtskvWIWHvLeIFvEt+ed
         i9MBJbRCdBr4WYnGa1Z1EYI+oPr6nL/dq6nxpVX3anLnNL3u4fYZRpmev5N4qK6C0rqP
         zb4M+lXZ/mofPSRxrjjBSu+y28Zl7UgxDNj3yRcGvq4X65gYWRcdjPQ4gloivpRvNGYW
         V2LTvkiB+qnXWsaxGtigyreSkfxXEVL5/03CACjAW8dsWDvaCulh7cHkK6yN23n4hit1
         rFdk8aS0aPGM2M1p+u9H7qpuy78I4+BWJ/BQXxbanXr24u1KsRBD4qTnOvHzS52HyCfc
         f7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785811720; x=1786416520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uu48l08iOiq9g5Bc53dhkabEeR0zOJy6W3JS0tzyMbo=;
        b=Zxo/j3ON2x1/0lbWnSCgDEmS0Gi/tl76V9uu2x+cRWDq22sn+2GE9EAH1Ij79PZCtQ
         0V4Q3T0/0sbUd+MSudUMLYJPT4T1PB4newHezku6LqV7BTukTlT+FIlY6TnBbs/v6Smz
         IR3dJjrR5LmqAxbf6IIVxF4SoukflwrXSOpLo0Dwe29TyfyxB8dZzmxQzdalSHayonR/
         zKoPVCVUJJUPwFaoGHCv0W2er2lewS4JX6yz/rfldb3qTFSyyqXfCxVRXxlIlZnwV6j9
         5s1oC3C0b0rjgT1CNiUYIAZdjWlilHMsb/RnS0U+jQJqmmMAoDMXIl7k8u3XwXNjSoqv
         +gcw==
X-Forwarded-Encrypted: i=1; AHgh+RpJVJv2JD3zsUdQbA59ThC0vn2PpRw6DA0aYPcz8fdD356bVpoP7dq1sbNb1BL63OXAtKTB6C4PEc5i9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHWbu5MWv/bcoG7enqbf1svSZbudz3YJ/m9DfkECPU0VB08JGM
	neaTzbrnag7ItdsHjJxvhNN4d7YMqvscI+DDlYnG4f5zdE9N+kW4a7Be
X-Gm-Gg: AR+sD10xRir7D3uYUXIY+c2nV4RMBtz71zDPUPh1JC4czpLgfsAYD09GqIEKck4CPbq
	NB1/X4Y1IhFu0ixhTIeqCo8B1mRK/q/jOJ+awov27Z4Ex00HGA5aQMVWAIYildYQ6KGTcirwEW5
	e57yA+iBCRV+P4xzyZIz5v2GcFoNoA5tLip5Xz159j/s3KUj/UUAE+f3GVaY5iNE+akfwyOvRFJ
	ePnJCVvS8jec7H/fQrF7Dk64bUF6lGzPSILw+PgNxBefzncbKJUgwPZGL4VTv8k4Vef4Kitt460
	3F1aK+xIgfYPs7Gb34/jw8mssD9lgl4Ju6Pbpvc4YAiiVkrxU9FqrDG5sMktxOWzHvW9adigM1g
	4qNiWkGmWcmIwoqg3ZteEydrx0tSb6Drc8rTkaIt0TEbysnuCMl7CPQAsPnQsciGBIBECLLc9n1
	kBRuRC7TRs8n5sep+r6ijfDxDDwDYb+9rANizRC71OWGFGEByoLMblIND+kjl5G1+8n1ymjtfiy
	jsvRF8=
X-Received: by 2002:a17:903:4b4c:b0:2ce:6d4a:5b8a with SMTP id d9443c01a7336-2d05242c4a2mr121069295ad.38.1785811720247;
        Mon, 03 Aug 2026 19:48:40 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5a91asm44837315ad.21.2026.08.03.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:48:39 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
Date: Tue,  4 Aug 2026 10:48:22 +0800
Message-Id: <20260804024822.2401012-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
References: <20260709115610.287420-1-yhchen312@gmail.com>, <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194841_354507_39DB9FD9 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Anup,

Thanks for the review.

On Tue, 28 Jul 2026, Anup Patel <anup@brainfault.org> wrote:
> This would mean that for the "notrap" policy the VCPU would never
> sleep and increase host CPU utilization even when VCPU is idle.
> Is this expected behaviour ?

No, that was not intended. With "notrap", HSTATUS.VTW is cleared
unconditionally, so a VS-mode WFI never traps and the vCPU never reaches
kvm_vcpu_halt(); since WFI is only a hint, the vCPU thread can keep
spinning even while the guest is idle - the high host CPU you point out.

v2 drops "notrap" and replaces it with "auto": HSTATUS.VTW is cleared
only when the vCPU is the sole runnable task on its CPU
(single_task_running()), otherwise WFI traps and KVM blocks the vCPU
through kvm_vcpu_halt() as before. The default stays "trap", so there
is no regression, and the policy is re-evaluated on each vcpu_load() so
a vCPU that stops being the sole runnable task switches back to
trapping.

So to answer your question: the vCPU no longer stays busy at the
expense of other tasks - it either blocks through kvm_vcpu_halt(), or
runs WFI natively only when nothing else needs the CPU. On QEMU TCG,
host CPU stays around 5% while the vCPU is the sole task and rises back
to the trap level as soon as a competitor appears.

I have posted v2 as a new thread:

  [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
  VS-mode WFI trapping

Regards,
Yuhang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
