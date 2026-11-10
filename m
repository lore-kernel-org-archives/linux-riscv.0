Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14A0606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R5q7J2+Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAugQkvc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1KTgUHxAxuqKAFEOlt+HU/lcDlk2HaqW6vze/07TLq4=; b=R5q7J2+ZyHXKpm9eH8aLz9SFl1
	ytGIoiB3WcNA3wJhVdUw3Zxwn7b3S1CRtt0UAcC8SdZ/e7IAqqYkYYJNSkqXyJHQJj+/c1RMXUWrQ
	+WjKp9+8cuENy539F8+eNi946ZjXkOTnSeKG8oXpcZ3XQPoyp5oybCmo5bnztK+bcyv+NzwyAPW9L
	fp8oI7sXYY0SI1IqJAW8rZlLNcb9layyCnh9gcaqu20eiA1G4FRsBgTm6RawocUteIvIVZ5Niuxp5
	eysLFtzoyLdlM7eT95M1zoRCgxL9+Gcog25MPbQ1DnKPeb/T5vh/0br83i9lX26BuPPQMoiiYm6w/
	c6VD7E4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrM1-00000004srl-0fgT;
	Tue, 10 Nov 2026 19:18:01 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrLx-00000004srP-1cNp
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 19:17:59 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-8b0cf2c0785so25290777b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 11:17:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794338275; cv=none;
        d=google.com; s=arc-20260327;
        b=G3DTwLZzEj0ZPtCroXcdnbt/kXI4iO2Dea3EQ2baqMgro7kFQTPGclfQvV06xYYMYJ
         2Tqbq6XyDWRJSQWPxvPEB3JLyjJQThWbNV1iGjfQioiiWaBz1h6+IpLQcJWpTf2RH2yf
         OYzIwpo5XgEBiD9xzjTwHwm3RMrjfh1VClmafF5hdgCUSsBG6D5cJBj/b3NeVgR+Z0uY
         bmRs6a5yD6gDqf0kY3Mvzey38Mi8q4WSgthjOm/eQGkDCglZBovxIjsEqDkynopQJYo6
         RjZQ7cPn0CSW8SwGK28WD82mr5ZHIJKQ7ejlKIvSNVngq8or2RB4VsucczQm5Pz0o+yQ
         4NYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        fh=N57CrQMaqmaGjvO47HiAdQ9E7ft1RqyGLkde95MNV7Q=;
        b=Hmlm0rQUFpfMPpITmZgHs3y3GL6DnFlVgBzBjp1zfTYmo+09F5N+z9++9LkSM0k3wB
         l/QFgYs78ZN/lR7KZL7fKajtB/yLJd3UwK8x0Zzx07MZVeL2WuumA6IkPB2eKxtH+cGf
         s7e47i4TNXfyF5yIn7eHjFXclKRVVfuxy5sr1/ufg1Dq9OjkVSvUT7podt3vTRCfpr5x
         tv4QpnNE/UcFdDsG/N787JxUqn2eg4bqIAK2gSkai5vyT/4fXEbnG7jgzRH88hVxJD1F
         ETeVN/7F9Q3pXdX5vAnRSVhliMw3bHBnHMCzR2qGHMfn0z0l91mbXSj9iK3G0A7AT+CH
         SuYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794338275; x=1794943075; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=aAugQkvcWG34t6656rL4BXHEFVwTf51rYGYk9HunTXxYQBPOOPnNmyEx6+VlEidKrU
         7IKwUBqmmfUuvkCRJYlU0OYlBR8REFRFXZEiNElFwpqKfACRShi7Rii0dh2DhpMwqXen
         We1GDCYUz/4eyf7BU9O9g3tFUvg5Ztv/QN1WZVSRyA2Z5ZmETdGXAx0szCdUcoTVCLz3
         kzItkH1D52PVPouffAmZdpw5Yq40/PPwapVujr2qm+p9LEF2vfP1+6oRj9qCaG99T6EO
         96Tuk7E/FW/+X626R9zsMUV8jQSx/KsHmDbVg8v+YD7v/hoJ5bowoG+dpS76ME6vvk21
         5l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338275; x=1794943075;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puDDZt/C2f5Dzo58o7lKVRrUWtH4KzZHgOy66M1m2I0=;
        b=kK8KAvgoNuWiirbHJ3XNUdMFVM1Ld5NTHWJEodx2qI2FIJ+Ut6BdLKGXSgSYC4LZgY
         VqlxXAZNw4ESqQypbGpjBRElU5rLNz1wQGb6W7lJfT1eLL9SJ14BCCOgk7PIWAZqtEBl
         IN2UvntJ0YrasE3MYSrV9osLckp18Yh8TIwec8SUe9D6rDMXMrNixxpy0ZnleycF6p0t
         cMv/OVShynQQZWW3YvgmrNQjB3Km0pYVlAKT3zTLKGijwG08zu7wEB743/D/WtrPFsOs
         hLTfl4dc5bXSos0R1gI0wKsmUJZa9JtFVBCERPAL8zOdasS9+aY//wo+TaJHiMpWAs/K
         MRdQ==
X-Forwarded-Encrypted: i=1; AL+hErGAiXjGu0crhbrKt2Nrlhh7FZX2Y4igz94jLVzgSybh2jHN/t8xhMfwb9S+IEps9TF+TJrHFrs28PgfUQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+SGjpDBSbUitZclq0Lql6fRmbVBHEdL+s07h937xzWIasVfLoo
	9ddqJoXCehIVy3Rtr8OayTnZxGKz//zT8dtpT5tUHnhORZre4D4FdfpBEpwVqjkjPzi2L2uw28A
	w/1NTg26EcfCCpE6M1WSHv3Ux+2vKhuM=
X-Gm-Gg: AYBFou2MC1J4TPycX9XCZQwGvVG6pKljCtpLdCtyczd9EDszTRLB49BDKRJgP5vl4Xr
	44p2G9BSc0ESV9ZV0QDyEWqEKizIaL8hxeyEOo9HRuO1tyII1WYT1Z8c3QXOEwduHCePDnM3xN5
	sBxLhKDAXVd9nad3IFxZFQgPvFHZmoQBlBrP8I8+rDvDQDjUQYw6ZuaLEbTPGgd+Dj/CEtsAESQ
	LMnjbGRZACzsmaynNho9ELorgDZZ391bMjN1LDH4W3TEY/EOZ1aJnIlIERZxq3Zl98vopr2HkYS
	IDt4X15fUHFEAJWRO+JGqe7/qxqXS/i6caclao2q7Uffj9aL8AO1WEPs2Kg6S1p5DbQtrJQXtQx
	QsnggkdzMWxy3moAGw5yB4aqIjS1fqWyycuBTpQ==
X-Received: by 2002:a05:690c:a045:b0:8b3:59dd:11bb with SMTP id
 00721157ae682-8b3a80904bbmr1548667b3.32.1794338275490; Tue, 10 Nov 2026
 11:17:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org> <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
In-Reply-To: <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 10 Nov 2026 20:16:00 +0100
X-Gm-Features: AclHuK8pMvnG1Q-j9dHb2iJ_gKQ1ShQm5guoJXhhleP_Gp1CskmuEJKcLhqrA_k
Message-ID: <CABdCQ=NCwHn_Qtg-KZCRYWrruDWrP5Fdpeq_Ci_vtcbm92hEkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Yixun Lan <dlan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_111757_429683_2371F16A 
X-CRM114-Status: UNSURE (   4.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1/2 is unchanged from v2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
