Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052DAC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 19:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/JqD4trNomcVhPfE5xSzz2hfQe63n+sMjv2+IH0Z5g=; b=vZmO4+GjY3IbbQ
	RM/KdG1/2qsTMaVr4hDIuf11pBxZzQ0wC7ZZNMEBmbFLP3UK5nQdxRtOM2tYTSh6L+7WvUq96cvnW
	ia/43IXWJVUNyNUbBc9xQdpgqi9DGKspG3ZONnovd2dvbA6p1mXLaQsrwkHnx4U012ZXSuOZdJNJm
	tGLWxgVV/LUPnOCboyeevFa5OWZSw4MvJFbjwIQqKqz/5lXb4J2ZnkUscPIHRKEwcKlCI2REDpH5o
	EoyqLTYkidtJaxqWzAFY8JsmvjVucwwqrgvXmpi+05v26O2wIU2ILsx2uRASYl7ZrKVPcqpnnO8MY
	J2iawxbixfQc2xcjy1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwKy-0098bi-UP; Tue, 31 Jan 2023 19:30:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMwKw-0098Ya-2S
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 19:30:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 143so10809774pgg.6
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 11:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zandUZ3Tm0aytQS9nqqC5N+P1l58rEETrB4mxTtLnOg=;
        b=cVZMyZYdkHzjMPyz+29zB2zEmrJM84cjJoeaeCqB+JgSq+zKDMdK8QqkJd2cUryUJM
         X16U/bhqKBGBSJsWDXti/gzHOXpJzPSPcmeaD+DypVg0W5TdyI9ExImsvfGSzC869s9w
         OtCoZbSiMjTxS6dMuNs2RKw6BfxfQR2H9Z66M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zandUZ3Tm0aytQS9nqqC5N+P1l58rEETrB4mxTtLnOg=;
        b=Xrzf56wEZQ9ZfQBdSc6ta8pQnTiZWSmrHNgRRX+1OU0zCwwI7tUtFeBbDQ9URQOu3A
         40zQNv5xUsV416f3Ge1SZrr94/rwqspkemGeyX8xxpjTeL9yjIJSGIUeUraS8sDcnmhS
         R0pVNwLtO6yf8TG1ue/TKuKbTTWP4MGHD4TA+Xs/EPSyI6k9+hZbt7qIexR5L4ge74uY
         c3hEYuViMIpDR6JRW496wvkeQO35CLsRQT2HkyGLU/2ZAJMsKki3z48+vtY/jTPrtb2k
         5k0VKyMEL3f1WEW6GGhqIr+uEoPGsNGTJHlrvcsv/RDdLYDE9JmpcSFUrLzC4KQI+2PB
         Az2w==
X-Gm-Message-State: AO0yUKUFCH2ttKuBeyFg2P2GNDvtDLcE0omSwMnb7wuNN11GzHTX52SX
	CSFjeGWBEpxht2HZROkphA5gd1wzy41WH6DFp+o2
X-Google-Smtp-Source: AK7set83+A1QVYBNJ0oFxqG/QiC6KVG/mhilmiaXhkowEyp3VLWnnexRuwKDtvunnjkAKS6W2LFaiJMWMkh5dpQIfhI=
X-Received: by 2002:aa7:99dd:0:b0:593:1253:2ff5 with SMTP id
 v29-20020aa799dd000000b0059312532ff5mr2536050pfi.14.1675193429885; Tue, 31
 Jan 2023 11:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-4-atishp@rivosinc.com>
 <Y9RV0cOMld20EFBI@spud>
In-Reply-To: <Y9RV0cOMld20EFBI@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 11:30:18 -0800
Message-ID: <CAOnJCU+16EEe0OrNY3ZW_FS591+KmG5ap1OTjOL+gtqGtr7nLw@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] RISC-V: Improve SBI PMU extension related definitions
To: Conor Dooley <conor@kernel.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_113034_197252_51B0EFD4 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, Jan 27, 2023 at 2:53 PM Conor Dooley <conor@kernel.org> wrote:
>
> Yo Atish,
>
> On Fri, Jan 27, 2023 at 10:25:47AM -0800, Atish Patra wrote:
> > This patch fixes/improve few minor things in SBI PMU extension
> > definition.
> >
> > 1. Align all the firmware event names.
>
> > @@ -171,7 +171,7 @@ enum sbi_pmu_fw_generic_events_t {
> >       SBI_PMU_FW_IPI_RECVD            = 7,
> > -     SBI_PMU_FW_FENCE_I_RECVD        = 9,
> > +     SBI_PMU_FW_FENCE_I_RCVD         = 9,
> >       SBI_PMU_FW_SFENCE_VMA_RCVD      = 11,
>
> Alignment looks incomplete to me! Looks like you went from 2 RECVD and
> 1 RCVD to 2 RCVD and 1 RECVD! FWIW, the spec uses RECEIVED for all of

Ahh I missed the other one. I have changed everything to RCVD just to
keep it short.
"RECEIVED" is too long :)


> these:
> https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#114-event-firmware-events-type-15
>
> Thanks,
> Conor.
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
