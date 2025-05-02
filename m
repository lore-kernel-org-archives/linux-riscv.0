Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8F8C3ABA3
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 06:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q4GimME99X1V+hq2HULpB7ePiWBrp758Wrw0C+nYxA0=; b=EF8KwFVJkjQR8+
	+IM9hEspRTWoxP4XzhoEXhEZ7G9b9f/0Pctx+At25ROkzoBN4Vt7y0Kdrd1JZudXXCpNddAoYJirX
	+AiPZXk5tJM6bpnlXctUeU5Mzniuv/h615PKWAppQBjBwN4NJhIctNbQRd1K+ITO77CCFl0RCT4ko
	ove5bZIe3v3ACte3JESYjU7yDUowZl0DBv5NZlMM59gzis7pfk3dKDAZKpk9uag+Rk1ePxfFX/NJo
	+qgHt+c5ZtH3/YKcGfnsf8BYrSYMPWVZDWokRJ5GN/TPAxSd7cq2R6E7qcUFhfNKfaKQCN6gTpjnF
	G95+i1J0uzZQ05yNThKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkGb-000000011g8-3f1c;
	Fri, 02 May 2025 06:53:01 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkGY-000000011et-0D31
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 06:53:00 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d96d16b375so9592195ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 May 2025 23:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746168777; x=1746773577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLTAl+FeAYSKQcQF7p9sJodq+vcj25r5QAMFCz6+Z3s=;
        b=EsqC2KIG65DYwGNpbBzkbTndBoHsCpyq03u7Ujlr8+A/4s4axqQhS3N8b+J0MlBsox
         6+8JmvARd2m3aCX90XszbYYuaEHfXZPL+0cEgz6geH1n8Jhy8UybhYL0zCRfD3DmAEZn
         mzrCcGS8GevS0kUU2CCvORCWK3NWRcDPgiW/FIy837ZyijVkq/5HQE9oZmTRZ7QX18sl
         48tNgm5V94s/BwkNisWCUHWYEWOr260KpCA6WzEUppi5hTCw5GpSVJN+cJ4hvcEKyyIZ
         UL8snsL8pPA8vcFrMaIi+OKmHccANZltcSY5H+MwKGr692YVUp1D2r4M4S2rROwaEIUS
         dqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746168777; x=1746773577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLTAl+FeAYSKQcQF7p9sJodq+vcj25r5QAMFCz6+Z3s=;
        b=J8TSoO8FElXPYKbbye1rEdXxta3PZFTaTTZXol/2M+UVT3cF5yQRBgkiFc+MSclgsy
         UrxGehs4KfRpRVb0ouLKj5EZaqTBW+i+3K0gTYoqg4Tr/JQuZZxXHqi9ceJbuv6Sw1oH
         9IS9QAkLLGt/WyVQKoUgSQdsdtj1GDyOYuANFgTmkRtR+nRJc8nPZLBPUi3wRFXVGtsj
         qCl3frayR0LvTfG825UWIDexW3PpabvM9Aog5ncPXWsP/Moe4sHT9GDneSU9wL7Lw14b
         vrZ3f5LW2UbWzsJ4EkDNooNeFDtvB/JtPgTSwE0x1Zp1yuQ3iAfyP5MqwPN8/MTprO+S
         82uA==
X-Forwarded-Encrypted: i=1; AJvYcCWBwX2PaBZUXe5lVxX6Tc1Jqi/tldosIbfwM0wUft9YR3cTAlgX51FJ6Zy8iAb52U780e7EwwuC6N1Q/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLbHzYYt7vS+yv2tnLxrORnhndZpX4lh0vAlbA991hkLNuNb/9
	fA3QVPVNdRBsiVzG2+okWwVjwnF+bT9Z4900QL0YGBEVfHM9jmBYeC/fHHrc2xU+Z0wj2qsVWMJ
	tokDgtSnb45nz9d5yFvDakgaZBjlUMFobeKbs3w==
X-Gm-Gg: ASbGncuCQLfFyMDU8AJbjXWX/q+CWRzrtwfnI4FGqpMcqoWK8L5pw0NQuq5qTH8GfrN
	PZVDOBqj1KYNBNsYLFiUee+K0xMLWgdjmaTsrTrdycobxD+BA2PjPKTM8Y0vZRvdEF47FxZUMu2
	kkmRfjP0hHsLIUM8sUKLZOZxVuZUxcCZjGFA==
X-Google-Smtp-Source: AGHT+IE3Tx+D1sTsJd7eLqFty9WstV2/FtUKtjDrFtmODwKSFJySlTQeqvcdWL3dLUeN0h3IDPBFvj6uN+EjXA3kCW4=
X-Received: by 2002:a05:6e02:1fcb:b0:3d8:975:b825 with SMTP id
 e9e14a558f8ab-3d97c141a61mr20039855ab.5.1746168777040; Thu, 01 May 2025
 23:52:57 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 May 2025 12:22:46 +0530
X-Gm-Features: ATxdqUGAB19XvC5KYJ0fhdKln-jTeRa6jT7I7LFhf0qZedVaeYBhPkotn1vsv9M
Message-ID: <CAAhSdy09tkokvdvACCQACLdvppTTQHDOR+O4jtkhVP4PaW_k7w@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.15 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_235258_353449_9B3A721E 
X-CRM114-Status: UNSURE (   5.74  )
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

SGkgUGFvbG8sCgpXZSBoYXZlIG9uZSBmaXggZm9yIHRoZSA2LjE1IGtlcm5lbCB3aGljaCBhZGRz
IG1pc3NpbmcKcmVzZXQgb2Ygc21zdGF0ZWVuIENTUnMuCgpQbGVhc2UgcHVsbC4KClJlZ2FyZHMs
CkFudXAKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjQ0MzI2NTZiMzZlNWNj
MWQ1MGExZjJkYzE1MzU3NTQzYWRkNTMwZToKCiAgTGludXggNi4xNS1yYzQgKDIwMjUtMDQtMjcg
MTU6MTk6MjMgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3Yt
Zml4ZXMtNi4xNS0xCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gODdlYzdkNTI0OWJi
OGViZjQwMjYxNDIwZGEwNjlmYTIzOGMyMTc4OToKCiAgS1ZNOiBSSVNDLVY6IHJlc2V0IHNtc3Rh
dGVlbiBDU1JzICgyMDI1LTA1LTAxIDE4OjI2OjE0ICswNTMwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpLVk0vcmlzY3Yg
Zml4ZXMgZm9yIDYuMTUsIHRha2UgIzEKCi0gQWRkIG1pc3NpbmcgcmVzZXQgb2Ygc21zdGF0ZWVu
IENTUnMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUmFkaW0gS3LEjW3DocWZICgxKToKICAgICAgS1ZNOiBSSVNDLVY6IHJl
c2V0IHNtc3RhdGVlbiBDU1JzCgogYXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
