Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C406BC3ABC5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AFTH+fRWhsO4x0iU1KfkN26l/uUByVYQvNg3SrwuK8s=; b=w3QDETwqifRSCr
	Xp+GUN7A+5f4gXYkAYmEeZSs2xXDDCmOFFJRFpsFNTeDsF1OBtvi0IrkM1zeQlRX+5RgNNq28wfXF
	oVKTKhSkYHEIpBoP9qBfrRtFmJYyrGU3v2dhih9p4nxzUDtCmHulI/7oX7QcxDOQ+vBMyYIX+Nr/x
	+23SB7G4U8vA1AL0EMgLMir0BLmpbTOZ0xK0poT+zOLhuX7d9Nkkw7EY516Z3yXoBIM7nYPl3pkjw
	0k9xZ1MxTgWPY7lsCRSjVbghrk3qkGCnHTxiISgxXlUr6i9gIFSTBakSzYCFXqDzwrVwDPCnddAF4
	oV2Hu4oRFshZ7ZLNhP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwlL-000000008Xm-2NPy;
	Thu, 08 May 2025 08:37:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwWL-000000005yz-39xd
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 08:22:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso4097305e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 01:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746692539; x=1747297339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONdFAQ5P5cYSHok4vt/xoWp2gEIdFn3GfsMoftwXziY=;
        b=dr+Xdy/G5yjf1z38mFV2z4XjqTNfRfCHEBPqphzF5Uq3TAg35j1dDdCYflZgwXVqKs
         34rZSlWsUZt42yb3zUskYO6+CrYfMzRE0JXXTKv4zzB3H9+Iiy7EXLkJQuTws4SwPJFx
         ceZIoutg5UXizhiH3eF0qe9oVovfnAgwafvA+qWmFCryJ6W1SgrGv4pRSsr9kmaR8+Uh
         ocFQVH9D3zr2EyHNTsMJRTFyTiLy5M54m5ZvigeZvrYL/OPp+H/3ukEcgGDXbQ0v7k/j
         ndraCrWkT/KxbSeeur/szX3hAmNkvJQ6T3ta1Adpa1yCRHiKsHgV8PhUpkWKQmbiY4S1
         aQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692539; x=1747297339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONdFAQ5P5cYSHok4vt/xoWp2gEIdFn3GfsMoftwXziY=;
        b=KOoTMONZVHpmGX+eEY//5zL/5cnB8ngvpov+a4GHT7FaqZvgKqqBkEPioFwS8pzU+s
         vNUOWepbTo7cKBBk5evydUHn4icV5O4zsFu3IWk3l18DlNbMj9pFZCunI92kltsdedxX
         lRxsxEgXj23CZubvb2+9BHrXKw36eRqyXwfhC+7TGd0Ksc5R0fswpKn3TlG0y+aVTGtz
         wCdTWNrJVchqoStLf7MIflGlOsQeAdL+IIfkkClDwLv8vyHjUrlFD1UUyJ9TE2f8hJ6c
         bqUEQRDSsCQYuHo37E8cXxAf60F++aCqNidUyaUuII0gOggMzt9dAaCQTbEuPvklo0pX
         y6xg==
X-Forwarded-Encrypted: i=1; AJvYcCVGhZWrDLtFfs9LacPuh+F+w0uILQMJuUFLE8sf5Emx0tTMQO9znis5dULHF5X+QTJPC7Ewf45N47F7Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4aFWPsToc0nXGyyuj+pJB8JI+wrHSgxuQNckX6qXl07eumlvH
	ZXMsos8zVPNi3ZBUYCR9vaY9OJ94b2k7v7AIQvPdHH8GnFVgSpR/ncaGuXWlRT6AuYlqJH64ZaX
	z
X-Gm-Gg: ASbGncvff81WbTO73GBKzQOidZR0oLRTjmqHz2QQPOeUYCrT02T2TBFQUsrvQIyYu9O
	4QPzQRghhu9eQWCwJDIRJc0CtyIoDOsq+taxcuFyj1NX6IMltf3dHwj6mZq8rQLSkAq9zqeCLeS
	e36Vg6z0cIEkKNc9LQLzClfLU3BIHs2k6w3YWzVNyEKBD7i3acFn0p0wvMEtjMzATsDqdJv4l7l
	k10nQSUjFOjMG8Q+n2gZwDpB2J93osYYD6Pj309lsfPyKshDS12v7BcwOADFIPSNbM/BEgJrtju
	s7QAJm3Ootqko4FBUvLWNWY4Pdn1KVX5pWPlIwdoxt8stdtvzaM=
X-Google-Smtp-Source: AGHT+IG8ZUsqDihvY3hcYFCE6vFamKLpHiAoEt3SaBH65DeVtZsbz9VqIVxia3B+zR7RdSZEbZEKJA==
X-Received: by 2002:a05:6000:1acc:b0:3a0:8295:9e0f with SMTP id ffacd0b85a97d-3a0b4a186cfmr5374862f8f.54.1746692539617;
        Thu, 08 May 2025 01:22:19 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c25sm19695125f8f.17.2025.05.08.01.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:19 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 0/3] Move duplicated instructions macros into asm/insn.h
Date: Thu,  8 May 2025 10:22:12 +0200
Message-Id: <20250508082215.88658-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_012222_057511_639E1577 
X-CRM114-Status: UNSURE (   6.53  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIGluc3RydWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBv
ZiB0aGVtIGhhZCBkaWZmZXJlbnQKaW1wbGVtZW50YXRpb25zLCB3aGljaCBpcyBlcnJvciBwcm9u
ZS4KClNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgoKdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNDIyMDgyNTQ1LjQ1MDQ1
My0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCgpDaGFuZ2VzIGluIHYyOgotIFJlYmFzZSBvbiB0
b3Agb2YgNi4xNS1yYzUKLSBBZGQgUkIgdGFncwotIERlZmluZSBSVl9YKCkgdXNpbmcgUlZfWF9t
YXNrKCkgKENsw6ltZW50KQotIFJlbW92ZSB1bnVzZWQgZGVmaW5lcyAoQ2zDqW1lbnQpCi0gRml4
IHRhYnVsYXRpb25zIChEcmV3KQoKQWxleGFuZHJlIEdoaXRpICgzKToKICByaXNjdjogRml4IHR5
cG8gRVhSQUNUIC0+IEVYVFJBQ1QKICByaXNjdjogU3RyZW5ndGhlbiBkdXBsaWNhdGUgYW5kIGlu
Y29uc2lzdGVudCBkZWZpbml0aW9uIG9mIFJWX1goKQogIHJpc2N2OiBNb3ZlIGFsbCBkdXBsaWNh
dGUgaW5zbiBwYXJzaW5nIG1hY3JvcyBpbnRvIGFzbS9pbnNuLmgKCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2luc24uaCAgICAgICAgfCAxOTkgKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC9lbGZfa2V4ZWMuYyAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDEzNyArLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gv
cmlzY3Yva2VybmVsL3ZlY3Rvci5jICAgICAgICAgICB8ICAgMiArLQogYXJjaC9yaXNjdi9rdm0v
dmNwdV9pbnNuLmMgICAgICAgICAgIHwgMTI4ICstLS0tLS0tLS0tLS0tLS0tCiA1IGZpbGVzIGNo
YW5nZWQsIDE4MSBpbnNlcnRpb25zKCspLCAyODcgZGVsZXRpb25zKC0pCgotLSAKMi4zOS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
