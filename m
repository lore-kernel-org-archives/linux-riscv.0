Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC66D3B7D5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 04:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFm2mANqqvO32RwMc6OZ0UxuBNj8u62tDmk1wU0Q6MA=; b=30fs7gF3RzIyar
	LlX4XuHB2rQFD86EYbNISYQEu9CK6xjcY0u/3Ap67rV/UnpI7vLTi4wFYvji8HB4ARLMJL0oIsF4b
	8XdWZ/TT2SEsTgIdFjiXIa0FZjfzzz6euWazrYRB9PKRCE3x0itxT0wbOgF7J8qZx5E1FSDE/ttpH
	6SCUG9exR+bkFTNdv8aNZDhP+6YI1eEwzEEnxdi45LO/rpE8kSaKTM5IMVRX8rtDj6fPOZJicYTQq
	lnxZDlCDDFC2Rnh/QiqxZaa0cJmnduWjt2UkmFKoJn0uGmRiNs6APhD89d8e7b4j/47o5y+K/0vap
	fUixTMNjAOu5y4Sq+LmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQub-000000072mH-01G6;
	Mon, 25 Nov 2024 04:41:25 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQuX-000000072lL-2DFw
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 04:41:23 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6eeb3741880so35520397b3.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Nov 2024 20:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1732509680; x=1733114480; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1pNNbcGCBbXdC4+QgyDLvL/2M1OTdSL3R/EYdrl1AGg=;
        b=Otw4Er8H/Yh0GagnJ8Qc4rqSvNfQwLOkmdddADIjXjTh7DID0aMmqieWkwXxk9cCqf
         PgiBz0ojkKbHD90zOdpJU9Q5kcyJDA6lX5u3fwVWaq5bqNtoHfdEX8/qBL5VXChGnGvq
         lxeXKrlgi9n1Dq+Lw+FqPFGgtiy4PI7ro+8bmCmm94XufQ4wM25+qC16trfP3D0xf7Vr
         g9yODbqf1gvo65k0Riyf/DB2Br3+sjCOVU9iNn/FIQKrJEgfCqb3w/KRYc72CD47vurm
         jLDRfa2VTmcpBypbo/NkQBpc9H61PET5xsjY+Rz7XXBpMgLH074VlcNtm4dz89nyDCl1
         zDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732509680; x=1733114480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pNNbcGCBbXdC4+QgyDLvL/2M1OTdSL3R/EYdrl1AGg=;
        b=ve6ARTrDmbEO1FaEW/rk1LMB5vm8/T7zOWBzVYN0n267EJaQYyJF9QMLiEzOIPbZro
         AvmFOtGQhKBM9+5S/MfIuPPQu8NI9DA6xey4VhsBxpW/rgUlGgDjadBkz1sN9+54Ra2A
         /7t+AcjAbABFs4HscaTSaLZbZPvT1AZ8ftgLLbG4mFPH8HndlJaKRaO5GyRAw4RulCjO
         e9JIfdfuvLex9ABKhKvT3iQDGPj8NVAMbo2DvHV9zTNL3fi9eQm9EXiDXu0kK6sLBfHe
         VjEzr+Qw+qVWVpmcgJxJC3KLwd8wKtUWXhxjR3IDkvvBTroPWs6tapPQqJv2JDZGvWCk
         cFOA==
X-Gm-Message-State: AOJu0YyG/G/U6LfQHBak5qYfXzy7Y9Ef9llxPZQp/ouHQMkVWJfXs2ID
	wei8YAmotQ/ITQCT7oRke3v0gaM2EUvwlV7oVJYCr2U1TOlARTfs9dVV64TN/vyxbJseTnChOTA
	BdJ73bFT/DOiEpUXqeBn6fpLx4TPYvQiuC7V8lg==
X-Gm-Gg: ASbGncuq0XNEvBRPDLuNoMNqaPXvUumDlaq45qaTu+JTMdlE7YrYDtfxEg5FggqL1I3
	jFwJtHNvrFfL7zgs96HgjpeLYrm+MKXJ4
X-Google-Smtp-Source: AGHT+IH7LbTX3/lhOrgZROgnZXkV6ouT7CnuNSnpRjQAQr0qeF+10w6DXonD4fznFTD0sKEBkOZGJbKdhlFSN6s8ugE=
X-Received: by 2002:a05:690c:7011:b0:6ee:bbe2:ffb3 with SMTP id
 00721157ae682-6eee08b90c7mr91749457b3.25.1732509680285; Sun, 24 Nov 2024
 20:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20241124221458.347464-1-michaelneuling@tenstorrent.com> <CAAhSdy2Qq61qSLkuFkgiT2o5wXNDp3qO=U40AU1CFkcY6iNYhw@mail.gmail.com>
In-Reply-To: <CAAhSdy2Qq61qSLkuFkgiT2o5wXNDp3qO=U40AU1CFkcY6iNYhw@mail.gmail.com>
From: Michael Neuling <MichaelNeuling@tenstorrent.com>
Date: Mon, 25 Nov 2024 15:41:09 +1100
Message-ID: <CAAQMj+ojdJ3iQ7HHpPudai=yuKwKwhT4VFCdAnrAGA11oSPgcw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	palmer@dabbelt.com, Michael Neuling <mikey@neuling.org>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_204121_567075_5E0DDB0E 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

> > This doesn't cause a problem currently as HVIEN isn't used elsewhere
> > yet. Found by inspection.
> >
>
> Fixes tag ?

I'll resend in a few days but it's:

Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")

(I've also added Atish to CC who was the original author)

> > Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
>
> Otherwise it looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks.

Mikey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
