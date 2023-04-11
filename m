Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30232C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 19:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zF+ZG+CQTtAw3ETy6YMSLltRrH+wWK9zWwdPikVaBts=; b=rflCgyKNUJYJ00
	IG0GdnE5NJpsV2RGNblcck+QkK2EAofvMjZf34d30xgaooVXkardtBm8y4gTck/GKIqt6dpGZ37Lw
	pMvOO6ghC/4mtiKTrzjfPdsMrJWENM+tqIIy3bDhKTUBKuH9R2vCPKdAEEYTxoqiBBR63nVM1EV9f
	OXaUxo1/fBZcuNH4TFa1RPFn5Yt7Ln+sB9awH9LWHZZbNwlX88t1DTgaDdx9mX5ymAJwMAUqdSx/F
	Lw2WiWGn7W0xyB7Ymhs9DHS+d0ze4e1tpqtGy1/MsEhK3YK9j+35+pvxUnhrv0YaGE180z1lHc/M0
	LfgCYYrmFu5Tf43V/ViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmK3k-001067-3D;
	Tue, 11 Apr 2023 19:53:45 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmK3h-00105R-1j
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 19:53:43 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-635df3bd6e9so3689120b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Apr 2023 12:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1681242820;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQOstvP26Jw/xEzfU6weu3xhIxuQrtvrz5zj8kLH950=;
        b=WzysdZ64VnnjDZYtSxpKNptHU2kQbF7iWacu9kmJuWnfJM4V0EtQ74qHpt0bqbf7dr
         SNuMB+8uq5cLi1lAEleRA7Q7S0Dt5gJM/CP6vqYu7roIjjp6ZLU/MOSWtQKhwUWsFkdk
         e3QbMGYmv2/TAjwgmRTimPcNxDn0YhYDxakCiYNmpA+uCl6ZsSXI8ZJsQwdu421v3imP
         eEfLpfHmYA3ELyYK1fqj0KfTekYYhj89Lidnd1SntlSLzlsjC4O7FxPSYYMWqqQRJ+dW
         FyZjFkYCYD2uG/7XZHv7X/KR8j+AtYdWBqMWEl1ojdi6L/kIzMy7Frd+kwPzn9VmoGiv
         bXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681242820;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQOstvP26Jw/xEzfU6weu3xhIxuQrtvrz5zj8kLH950=;
        b=2W7cEvbeN1F6sBJYEZ+mAf1ej1H9O8/uU0fCvyqdJ3xMONpUs4k0ONMOn5PmpXt7pf
         IPWz5yT2uMEQdY84mwzsQnJASaYm/32Nxif+Ink9imKA6FNlYh7XrXvo0ZomgC3YdynD
         UxZGbzNJw7bS/y+jlFIycjKfknkmNdjG9ECn2BqLoUVHboQLIHW8OgYaGGKID5ez5P7c
         u/EhjvZ8jL6/hhtRrFxCgT+uyd2vEbyQZJED3cWabFrG7KBn9TTq0xTI4/SrMa6L90pa
         OqEHMoQDgI/nK2N/RLG6/BJ7YP+PetUEJxihLmANKQouLfrMJy3GcXWtiryGH7lyVV+b
         jlVg==
X-Gm-Message-State: AAQBX9cBjjReOdyPfOwQ8PcieMgZ/4RljFCPKLycsTTaaZbynhKefibq
	dvCXkfxzA7+eNoKAxIdH008gWebD8VRjBkTljU0=
X-Google-Smtp-Source: AKy350ZeRr3Md+KZ1Tq5IdbQ1kge8uUg998P85hA5s5eSk6qCP+Ea7AEYyMdS1sJ9jlDLAg9+p6nfg==
X-Received: by 2002:a62:8448:0:b0:636:8e5:397e with SMTP id k69-20020a628448000000b0063608e5397emr350485pfd.12.1681242820004;
        Tue, 11 Apr 2023 12:53:40 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78c56000000b0063a1e7d7439sm3126160pfd.69.2023.04.11.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 12:53:39 -0700 (PDT)
In-Reply-To: <20230406101130.82304-1-mathis.salmen@matsal.de>
References: <20230406101130.82304-1-mathis.salmen@matsal.de>
Subject: Re: [PATCH v2] riscv: add icache flush for nommu sigreturn
 trampoline
Message-Id: <168124272891.19605.13444107238273618155.b4-ty@rivosinc.com>
Date: Tue, 11 Apr 2023 12:52:08 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
  Mathis Salmen <mathis.salmen@matsal.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_125341_578517_4466BAD9 
X-CRM114-Status: UNSURE (   8.51  )
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


On Thu, 06 Apr 2023 12:11:31 +0200, Mathis Salmen wrote:
> In a NOMMU kernel, sigreturn trampolines are generated on the user
> stack by setup_rt_frame. Currently, these trampolines are not instruction
> fenced, thus their visibility to ifetch is not guaranteed.
> 
> This patch adds a flush_icache_range in setup_rt_frame to fix this
> problem.
> 
> [...]

Applied, thanks!

[1/1] riscv: add icache flush for nommu sigreturn trampoline
      https://git.kernel.org/palmer/c/8d736482749f

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
