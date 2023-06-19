Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B021FC0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvYVgzOcDl3X73a35PvaYz2f6d2YNERA9jDWv8czSKo=; b=Hwm2/R7ith6cUQ
	LViRB2odEJsPN0Xng8vAeQVrXLZB2w8hBSJbyaNM/K7EUPJS2T+PNet6kFGl3Uo98bAaJqEcAjuaR
	HZPO+U3fQ0/ArdDMdNSCXklg9QXc3adP6CIiZjAx4P7rZprwtD7Q67OUd6OjZs4paz4bAZ7gSf5UR
	TsJx+xldbpNxjy3yujgHkTE9AsdfJJ5b3hMTmBvpjzkJt/ABeFab9mG8hK9EZ2Mv2as3ujJY51vI3
	zjNrWIywOrFpbQq9m5mMxq/xK5cNQHcFBcq+ye9nW4vGmYXj9Prm62n6ucfmfcRLMr7CWFbSn42gN
	VzLBPqMQjQTRMahF7BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgO-009okN-2O;
	Tue, 20 Jun 2023 00:57:20 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgK-009ohd-1f
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:17 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3f9eea9d0a1so42654491cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222635; x=1689814635;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLZ1rrSAjCioF7E6D5kKLsWm28oZ1qPFQ2kV8xR8pf8=;
        b=skpqvQs1Gh01iJEVOu7e4HH3IM6ewHFmqp2XfWV7tV0tfjPwuPn8VvnX1qvfR4sja8
         e8Y+SMsRdBIrTjj/TK0yeOurvNHVDUBn/4aj1HWj1m1nb1q2clueLXsV+BLkwCOIk0Vz
         MextXGzUic0ExbphFhNEIYIDi5l1DgaDruw2svq1S0no7IoGbd8dIABVkKz52FS4R8Df
         +t32LC2CCE3dSW33rtbYso40XkT96dVojnRuVOcnEQqKDYUciB3O5Mnw7olU78/oIhJA
         qpI07OVTH7kN3t8rTV3W3LJ7VlNs8WquhjWW+tP3Jt/mZY4CX8VHglSW85ewrBart+2P
         nEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222635; x=1689814635;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLZ1rrSAjCioF7E6D5kKLsWm28oZ1qPFQ2kV8xR8pf8=;
        b=fx8Wv0SSZUsyROb+N3iU9u9z+iB+kPriSOm8YEADdwInrB07OqV78pGcVgJcwOH//a
         OibfHtcIV37pFXZxoajl04iomklkJuqmU9/naJ9TkEWwPqySo+vIa858SQ5T6el00ks3
         KgjwxUgC5XdVx9nYpjB3sNYq63l+FKn17gE5/I6w7N79d1jAzpl1o9L7zPJ7mItytb5E
         PHQo+xm/JFPb703TKYvs9fQG4+PXgSg4axpf8ozH9m+IURlLCrJDBQiO1Iw9QMAUo81x
         rY8GaXx60rGoCD/ep+4h8gwWO/UagoAikwuh5deYIePkRlK/X91ntx0tjCgHIVJlBAu3
         s+Rw==
X-Gm-Message-State: AC+VfDz3mfP9cEjbPab5UsVm8fs0/OLFyzr501zPrjggZNuTj5h910mE
	YAgTq2skIXyd8x5Y7FWQ24XpyCbuShXY9MzDxps=
X-Google-Smtp-Source: ACHHUZ4sNWlosakuG86D5S9uKAqq10e6+UXGV18yICFf8Mt4a2tQt7KsoR18rLmfVp0Kh+lMSRJvAA==
X-Received: by 2002:a05:622a:1a97:b0:3f3:8ee7:483 with SMTP id s23-20020a05622a1a9700b003f38ee70483mr3013625qtc.53.1687222634876;
        Mon, 19 Jun 2023 17:57:14 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78159000000b00666e17004a4sm220172pfn.58.2023.06.19.17.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:14 -0700 (PDT)
In-Reply-To: <20230509152641.805-1-jszhang@kernel.org>
References: <20230509152641.805-1-jszhang@kernel.org>
Subject: Re: [PATCH v2] riscv: mm: stub extable related functions/macros
 for !MMU
Message-Id: <168721242540.30028.15321347837329883104.b4-ty@rivosinc.com>
Date: Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175716_563696_F8C7D6DB 
X-CRM114-Status: UNSURE (   6.32  )
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


On Tue, 09 May 2023 23:26:41 +0800, Jisheng Zhang wrote:
> extable relies on the MMU to work properly, so it's useless to
> include __ex_table sections and build extable related functions for
> !MMU case.
> 
> 

Applied, thanks!

[1/1] riscv: mm: stub extable related functions/macros for !MMU
      https://git.kernel.org/palmer/c/de658bcf0333

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
