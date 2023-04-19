Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638E3C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msd+iTOikmsrkLVq5LbiiGSTspaDaQril60xULcJtxg=; b=D+i8K1jnpwbRah
	QD7H26OU6b0w0E2g8WXMF4GvjI+cmeQ8OnUKAnFwl1uxwFkyoQM+hiZTFAnqgUPFfZHp6+6dxkeJ9
	YBcbCK5F3MN3CmYxbz5E1mlqX1Qm7pzDTOr7yhShgXGtq0Op5y0a9J0L7Nk0VTIZk9q/clBCv4/bm
	SpLqUtYivlSlROAX1NX4kn+ZMmk57Vtj+ZoR5VPwngxLPD/ts7a2x8qshR7zMw2la0c5XH3Q8MMnw
	JxjOeJGmZFbqs08IPv1ov+XurJqCEtKYmZoBPd6W05SN8mbdyIlmKHjdVnXDPGeMLJPhx79XGsiLY
	XBcqZkYUy54Tw/eAuF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvyk-00Bftj-2D;
	Fri, 21 Apr 2023 18:59:30 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvyg-00Bfrp-1b
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 18:59:28 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-63b5c4c76aaso1922413b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682103565; x=1684695565;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+EQ/x793Jnsa/kqgXiOJb3p0eah7oFJhucKW106Kl8=;
        b=bQyblJRyAvGuTLy7qPVklUSkkntz5faFsanTHGL8+W8tK7sfMyp8tTFo7QvA60d/UW
         JEVIbrj/vr3OdOv4W9eGM7+H99bBq3vk1HvaueHNN8TyjPI4bOlC4yFpFniBEltfCK9S
         a6SfS4IlzcbdMqiaWhNrZLZmlaZqp4ZX/MOCweDAHIH82q5DvegmFZF/rOG4iBUrgJsE
         /l8K3CJ6JeYhfbZwImHI9bK8nzBZfU1X6YjlosZiMF9YRwLusS1aYk1zweTU7guN0tR9
         KqgXJegycYDF46jiq+R0uNxxQcgUvLwrsKvS97bTmxb6phciqD3Mj/Su/ExzkZSsuk7e
         5pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103565; x=1684695565;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+EQ/x793Jnsa/kqgXiOJb3p0eah7oFJhucKW106Kl8=;
        b=hsHU3fiyj9ZI9138WIWq3lVU1fY+SWo+om38yE2udxyBMf8SBE/Ytw0/rMGkIohA36
         jO2Bal2P2ywkpRQUnwQvTt5TzpPMBT/E5eb9rC41ZRiH1WTSilqzLC5IwllkzGt+nEKW
         Ozzy/wiEuaBxEKldsB9II1nVMhCMSCXrbtb3DpW4axcmo+2E+Puwq+c9HFkkNZih95mr
         038spt43gdBnNfQ1urYSt0VD1RJ0tpwUYP8rV9pvDxOMeriCd833X8sDNTYnjkUV23ua
         vs9tSyLlA16Qa5K7J7DlvC97EiFf2c98HSJx2+vU2TFeUq/Iqmih8wV8bFRY+ZKREYFL
         hhcw==
X-Gm-Message-State: AAQBX9c9GOES5WCuDeme2FoYKBetM9wqsqBgmK5jzwZPHviQfLEPNyVE
	dMq7LKxpDZ9lS4P7z8MwJEeBQw==
X-Google-Smtp-Source: AKy350aPgF7/ICzgPm9D1rqVxYtdqSsows6+k23WW1suuTm43XEGetau1y5211vGXw0C4sHlJCV6lg==
X-Received: by 2002:a05:6a00:13a6:b0:63f:ec9:bc9a with SMTP id t38-20020a056a0013a600b0063f0ec9bc9amr7724187pfg.20.1682103564695;
        Fri, 21 Apr 2023 11:59:24 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id h69-20020a628348000000b0063db25e140bsm3299248pfe.32.2023.04.21.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 11:59:24 -0700 (PDT)
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
Message-Id: <168191616325.7488.14079862095622576679.b4-ty@rivosinc.com>
Date: Wed, 19 Apr 2023 07:56:03 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
  =C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_115926_534359_89D885FF 
X-CRM114-Status: UNSURE (   9.89  )
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


On Wed, 29 Mar 2023 06:53:23 +0200, Alexandre Ghiti wrote:
> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
> 
> The first patch allows to build relocatable kernels but is not selected
> by default. That patch is a requirement for KASLR.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
> 
> [...]

Applied, thanks!

[1/6] riscv: Prepare EFI header for relocatable kernels
      https://git.kernel.org/palmer/c/55de1e4ad43b
[2/6] riscv: Move .rela.dyn outside of init to avoid empty relocations
      https://git.kernel.org/palmer/c/69a90d2fe107
[3/6] riscv: Introduce CONFIG_RELOCATABLE
      https://git.kernel.org/palmer/c/39b33072941f
[4/6] powerpc: Move script to check relocations at compile time in scripts/
      https://git.kernel.org/palmer/c/47981b5cc687
[5/6] riscv: Check relocations at compile time
      https://git.kernel.org/palmer/c/c2dea0bc5339
[6/6] riscv: Use --emit-relocs in order to move .rela.dyn in init
      https://git.kernel.org/palmer/c/559d1e45a16d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
