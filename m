Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91094C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7T9KexzkvgaefmpGMmQ2S5fwfBpAEntp5EbyVtr7/Js=; b=s+0Y8gcrq58MCF
	312zkS2zYMkeDaiHySeXKfJRHo/HBBHKFsPNijyZq+LMa64IE8rR2faSRKcaV+P/tj1trnOqcC4Pd
	Cln6iXWdDT688tlpinRvg1Tvz3ViBYgV/jl2OCY1CdXgjlY45ht/sayo8ZlH5yG74vjkMdGu6XaVU
	LMKcv/6nWWm+oWzNf4aSAEEFbyDoem2y+NH9gqjqBOd+cz9Rhdx096ZJ6/n7QNWyVLFroeTtqmlHr
	Zwa8h2/Wmwui41FCpypf1o9hsyThl7D3BEoJh4STsSXc2BL5YUUsZlK/a2wXBEMJJiaDx8Y7WRbxg
	Iqvu7HwKEW2iU2LA/HeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2v8W-00GHY3-3C;
	Tue, 14 Nov 2023 15:15:32 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAn-00G8z7-1j
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:53 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-77891670417so55611485a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971227; x=1700576027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak2BDRIk2vDqh5U51tE5B/vdW3wNdZF+MHtrJJi5jsA=;
        b=Xdjw62BA0AACRMFeY/u9OJNgqu/Bw+Ev0fvIrFz54mQ6SGO3m9MAFl8t7S+O3cBJkY
         cEaDwQAcy78lYo6NdLG++uBTDS4QQyAudGYD9nAgRg6Y90MGMbz7s8PiEpy2E8tGgN3E
         qz5pZXjflUimunRQDlnsQ8n794ZwJ/1KdiAPMhE82Dw8YaRIqvBmdpKblwHZp/0Zinzm
         m71XHowDb67SXLIxtzuydDAubAv0F/bvse24Ul4wuJIf4yuO9rerzMfVmHG1IF+KZU8X
         w3WjrMCqXKfEyxxJH/mUs+Dm9gqEu5DkU9cgpnU8Jf7W8KGrc7p8ILM7CXihRrzBx9Y+
         v5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971227; x=1700576027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak2BDRIk2vDqh5U51tE5B/vdW3wNdZF+MHtrJJi5jsA=;
        b=jiiRCoDgAluRb6htG23UYXSXkL4GeGcQ5RpgzF/5qK8cdPK6TXNOuH1zsoiuVbuXj6
         7CPVyzzwq/UDjIcjTEDwyR9YzpNoAN/lIQTc0XbamfGPZUIRBGsdWtfsZq1j9GmADGEp
         DUg54dW1Opc1KsHuXG+LCYbHG8gBaDrXebQ4HCY5b1KYZq10kZyt+CRayfWR+1ZTE3MA
         CS+FtcMcssboXvKgBc+Gs8G1B9p2qrH57EZ1k44aKfl7nMkzI4VQ3TxvVbd/xeleAnPP
         Zg2gnMgd9DA+WoiY9lAavJMa3phq3UOK6WEqvE16v3D6OHle69pWXXm6ELOXXkwD39KF
         59vA==
X-Gm-Message-State: AOJu0Yw+TSGnTr/grbYGpbZp8VDcVJBWMu6ykk/8VgndP4fczrm3mRqQ
	j5V8v7RIrhQyvZQAgR10IM78FxlWhbZh5L69ww5kzQ==
X-Google-Smtp-Source: AGHT+IF2D+KBDRTw0WcUH3F5f9hiu2zqM89jEEHbneHS+TDtFN6UAjynE2yo55wJNn9K3IiKYTPHXQ==
X-Received: by 2002:a05:620a:31a8:b0:77a:69a1:b6a3 with SMTP id bi40-20020a05620a31a800b0077a69a1b6a3mr3097295qkb.1.1699971226657;
        Tue, 14 Nov 2023 06:13:46 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:46 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 11/20] dt-bindings: riscv: add Zfh[min] ISA extensions description
Date: Tue, 14 Nov 2023 09:12:47 -0500
Message-ID: <20231114141256.126749-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061349_597352_C9E13881 
X-CRM114-Status: UNSURE (   8.80  )
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

QWRkIGRlc2NyaXB0aW9uIG9mIFpmaFttaW5dIElTQSBleHRlbnNpb25zWzFdLgoKTGluazogaHR0
cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xejN0UVFMbTVBTHNBRDc3UE0wbDBDSG5hcHhX
Q2VWelAvdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwg
ICAgICAgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9l
eHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sCmluZGV4IGU4NDVlNDYxYjZlMS4uZjNjOTllNjk2MTliIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55
YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNp
b25zLnlhbWwKQEAgLTIxNCw2ICsyMTQsMTkgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIGlu
c3RydWN0aW9ucyBhcyByYXRpZmllZCBhdCBjb21taXQgNmQzMzkxOSAoIk1lcmdlIHB1bGwgcmVx
dWVzdCAjMTU4CiAgICAgICAgICAgICBmcm9tIGhpcm9vaWgvY2xtdWwtZml4LWxvb3AtZW5kLWNv
bmRpdGlvbiIpIG9mIHJpc2N2LWJpdG1hbmlwLgogCisgICAgICAgIC0gY29uc3Q6IHpmaAorICAg
ICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmaCBleHRlbnNp
b24gZm9yIDE2LWJpdCBoYWxmLXByZWNpc2lvbiBiaW5hcnkKKyAgICAgICAgICAgIGZsb2F0aW5n
LXBvaW50IGluc3RydWN0aW9ucywgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDY0MDc0YmMgKCJVcGRh
dGUKKyAgICAgICAgICAgIHZlcnNpb24gbnVtYmVycyBmb3IgWmZoL1pmaW54Iikgb2YgcmlzY3Yt
aXNhLW1hbnVhbC4KKworICAgICAgICAtIGNvbnN0OiB6ZmhtaW4KKyAgICAgICAgICBkZXNjcmlw
dGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaZmhtaW4gZXh0ZW5zaW9uIHdoaWNoIHBy
b3ZpZGVzIG1pbmltYWwgc3VwcG9ydCBmb3IKKyAgICAgICAgICAgIDE2LWJpdCBoYWxmLXByZWNp
c2lvbiBiaW5hcnkgZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZAorICAg
ICAgICAgICAgaW4gY29tbWl0IDY0MDc0YmMgKCJVcGRhdGUgdmVyc2lvbiBudW1iZXJzIGZvciBa
ZmgvWmZpbngiKSBvZgorICAgICAgICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KKwogICAgICAgICAt
IGNvbnN0OiB6awogICAgICAgICAgIGRlc2NyaXB0aW9uOgogICAgICAgICAgICAgVGhlIHN0YW5k
YXJkIFprIFN0YW5kYXJkIFNjYWxhciBjcnlwdG9ncmFwaHkgZXh0ZW5zaW9uIGFzIHJhdGlmaWVk
Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
