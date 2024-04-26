Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31F5C10F15
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2zwedCvVzs+X825bmN0d+NqhPwvB8ZI0U0cIQX0XZ1I=; b=MA4vW2I816IGQ8
	RHIOA4JR/oumagq3jDb885lltHYIN40pKKWhkdEts/MN6MX6/GAnXlSfMHj18OxjdnI1YZkMe/avY
	ItGPKMtgAYWNaPh0I0EXbIWi988mbf/O8Wpc7iHd2TceT4IGPvkjO76PuAg6UCQWNcNQcAftfzAN0
	aHi/SmUzZLhSapMkykwf5NLrWkcAnXOlL5Yhx/aYRGqEbchH+nBJU8kfIEZDQ7HNaVhhy9KWZz4IV
	gsRBPGS2xfE0xu8WLLj/I4n326z38BKGn2N7QltnAHHxLwV3d9LuEpBnNjYmsghI1NhlXbXwE/04f
	gjVLtyPYOaNJDPyfxj7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVH-0000000C3nP-3YWz;
	Fri, 26 Apr 2024 10:08:27 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IVD-0000000C3jE-22DA
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 10:08:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-344047ac7e4so1731390f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 03:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714126101; x=1714730901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbx1On+TTYqeoURSkZkCrdGwttFNEWRGbinjc3HE+Hk=;
        b=kDMXuvqcsoMIIjrDlPVQAU3aAbyjio8vrqOhzyiXCtIfcxtlPQGCIBc9nfMV59alSG
         LxME5tmAJoTB9pFnkKPMxWw4buQ6GSx1+TtD5moqeFw5hUcqAypAuWb3bKy0I4v84fJH
         PQmbHOylGu+LbMfWNGuSvEOaP6e77vaIqd2qhnoo61eaDVZVNtTLqkXzFCYYuEKOk9/k
         CByd7T1feRUqGiGk0BBGC5mDWip4WF+0YmaRwGYW3aRoi/ekr51xoocE4naDiF35qpkj
         8QJW0fchDLUBOZ0kiAVxvtd1Zxig9cj1IU1Gk9c1Sxfix3euR0NvrnUly1Sb+/rHnnqw
         Ks0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126101; x=1714730901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbx1On+TTYqeoURSkZkCrdGwttFNEWRGbinjc3HE+Hk=;
        b=Ig6kZslJsJWT/bJGLlEqMr4skTPmoFRcZLT/R2Bf37An2EwQjSJtJnAJfx/GTVN6X2
         z3+vdtNLdacQJFJQnEl3/91Ewk+aBVdP87M9YxXGu5I9ralQYHH7hXGqESwFHIOEfQB9
         7gaUc/pCN81RWQuaVhFkPwUaRaNKphj6c/TbcI15BeRrvfaQ8SzM+mv+7FvVL4mHlNI0
         bEzFXF3MeAhOm8Gp24v3iuYFoJ/2qBTl72xF3+bv1hDS/WCKF6Dao6nkGKFHGrKxwwyk
         Mfg5N3AREGoGcOE6BcJJjIm5fXF9eKoxhyxvigedb9hSriTafffo0ojpig2Mqure335+
         U2Ig==
X-Gm-Message-State: AOJu0YxJ8M3rFq8QLWRXCihGtAo6u+UiilpWY9JKsGW0uzKM+u51oxo4
	OXvZdXu64WpjR3KuAOUyJLjHfGi2m+0dPylI+OUTj6frC6dbBTpS8M4msY3nIEhPlWPh6ahp1uY
	3lWU=
X-Google-Smtp-Source: AGHT+IFq1PBLGeh1M4r+k/wSmDqxEHo8VdDIM9MYkH3T6k1cJcTZz/q7QYNfgMeHr+ScXMDq7gOpIw==
X-Received: by 2002:a5d:6b0d:0:b0:34c:4c67:c798 with SMTP id v13-20020a5d6b0d000000b0034c4c67c798mr1551849wrw.4.1714126101328;
        Fri, 26 Apr 2024 03:08:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j13-20020a056000124d00b0034b7906c716sm8823766wrx.106.2024.04.26.03.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 03:08:20 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v3 0/6] riscv: Apply Zawrs when available
Date: Fri, 26 Apr 2024 12:08:20 +0200
Message-ID: <20240426100820.14762-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_030823_687948_79D0AAC2 
X-CRM114-Status: GOOD (  22.99  )
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

WmF3cnMgcHJvdmlkZXMgdHdvIGluc3RydWN0aW9ucyAod3JzLm50byBhbmQgd3JzLnN0byksIHdo
ZXJlIGJvdGggYXJlCm1lYW50IHRvIGFsbG93IHRoZSBoYXJ0IHRvIGVudGVyIGEgbG93LXBvd2Vy
IHN0YXRlIHdoaWxlIHdhaXRpbmcgb24gYQpzdG9yZSB0byBhIG1lbW9yeSBsb2NhdGlvbi4gVGhl
IGluc3RydWN0aW9ucyBhbHNvIGJvdGggd2FpdCBhbgppbXBsZW1lbnRhdGlvbi1kZWZpbmVkICJz
aG9ydCIgZHVyYXRpb24gKHVubGVzcyB0aGUgaW1wbGVtZW50YXRpb24KdGVybWluYXRlcyB0aGUg
c3RhbGwgZm9yIGFub3RoZXIgcmVhc29uKS4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdCB3aGlsZQp3
cnMuc3RvIHdpbGwgdGVybWluYXRlIHdoZW4gdGhlIGR1cmF0aW9uIGVsYXBzZXMsIHdycy5udG8s
IGRlcGVuZGluZyBvbgpjb25maWd1cmF0aW9uLCB3aWxsIGVpdGhlciBqdXN0IGtlZXAgd2FpdGlu
ZyBvciBhbiBJTEwgZXhjZXB0aW9uIHdpbGwgYmUKcmFpc2VkLiBMaW51eCB3aWxsIHVzZSB3cnMu
bnRvLCBzbyBpZiBwbGF0Zm9ybXMgaGF2ZSBhbiBpbXBsZW1lbnRhdGlvbgp3aGljaCBmYWxscyBp
biB0aGUgImp1c3Qga2VlcCB3YWl0aW5nIiBjYXRlZ29yeSAod2hpY2ggaXMgbm90IGV4cGVjdGVk
KSwKdGhlbiBpdCBzaG91bGQgX25vdF8gYWR2ZXJ0aXNlIFphd3JzIGluIHRoZSBoYXJkd2FyZSBk
ZXNjcmlwdGlvbi4KCkxpa2Ugd2ZpIChhbmQgd2l0aCB0aGUgc2FtZSB7bSxofXN0YXR1cyBiaXRz
IHRvIGNvbmZpZ3VyZSBpdCksIHdoZW4Kd3JzLm50byBpcyBjb25maWd1cmVkIHRvIHJhaXNlIGV4
Y2VwdGlvbnMgaXQncyBleHBlY3RlZCB0aGF0IHRoZSBoaWdoZXIKcHJpdmlsZWdlIGxldmVsIHdp
bGwgc2VlIHRoZSBpbnN0cnVjdGlvbiB3YXMgYSB3YWl0IGluc3RydWN0aW9uLCBkbwpzb21ldGhp
bmcsIGFuZCB0aGVuIHJlc3VtZSBleGVjdXRpb24gZm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbi4g
Rm9yCmV4YW1wbGUsIEtWTSBkb2VzIGNvbmZpZ3VyZSBleGNlcHRpb25zIGZvciB3ZmkgKGhzdGF0
dXMuVlRXPTEpIGFuZAp0aGVyZWZvcmUgYWxzbyBmb3Igd3JzLm50by4gS1ZNIGRvZXMgdGhpcyBm
b3Igd2ZpIHNpbmNlIGl0J3MgYmV0dGVyIHRvCmFsbG93IG90aGVyIHRhc2tzIHRvIGJlIHNjaGVk
dWxlZCB3aGlsZSBhIFZDUFUgd2FpdHMgZm9yIGFuIGludGVycnVwdC4KRm9yIHdhaXRzIHN1Y2gg
YXMgdGhvc2Ugd2hlcmUgd3JzLm50by9zdG8gd291bGQgYmUgdXNlZCwgd2hpY2ggYXJlCnR5cGlj
YWxseSBsb2NrcywgaXQgaXMgYWxzbyBhIGdvb2QgaWRlYSBmb3IgS1ZNIHRvIGJlIGludm9sdmVk
LCBhcyBpdApjYW4gYXR0ZW1wdCB0byBzY2hlZHVsZSB0aGUgbG9jayBob2xkaW5nIFZDUFUuCgpU
aGlzIHNlcmllcyBzdGFydHMgd2l0aCBDaHJpc3RvcGgncyBhZGRpdGlvbiBvZiB0aGUgcmlzY3YK
c21wX2NvbmRfbG9hZF9yZWxheGVkIGZ1bmN0aW9uIHdoaWNoIGFwcGxpZXMgd3JzLnN0byB3aGVu
IGF2YWlsYWJsZS4KVGhhdCBwYXRjaCBoYXMgYmVlbiByZXdvcmtlZCB0byB1c2Ugd3JzLm50byBh
bmQgdG8gdXNlIHRoZSBzYW1lIGFwcHJvYWNoCmFzIEFybSBmb3IgdGhlIHdhaXQgbG9vcCwgc2lu
Y2Ugd2UgY2FuJ3QgaGF2ZSBhcmJpdHJhcnkgQyBjb2RlIGJldHdlZW4KdGhlIGxvYWQtcmVzZXJ2
ZWQgYW5kIHRoZSB3cnMuIFRoZW4sIGh3cHJvYmUgc3VwcG9ydCBpcyBhZGRlZCAoc2luY2UgdGhl
Cmluc3RydWN0aW9ucyBhcmUgYWxzbyB1c2FibGUgZnJvbSB1c2VybW9kZSksIGFuZCBmaW5hbGx5
IEtWTSBpcwp0YXVnaHQgYWJvdXQgd3JzLm50bywgYWxsb3dpbmcgZ3Vlc3RzIHRvIHNlZSBhbmQg
dXNlIHRoZSBaYXdycwpleHRlbnNpb24uCgpXZSBzdGlsbCBkb24ndCBoYXZlIHRlc3QgcmVzdWx0
cyBmcm9tIGhhcmR3YXJlLCBhbmQgaXQncyBub3QgcG9zc2libGUgdG8KcHJvdmUgdGhhdCB1c2lu
ZyBaYXdycyBpcyBhIHdpbiB3aGVuIHRlc3Rpbmcgb24gUUVNVSwgbm90IGV2ZW4gd2hlbgpvdmVy
c3Vic2NyaWJpbmcgVkNQVXMgdG8gZ3Vlc3RzLiBIb3dldmVyLCBpdCBpcyBwb3NzaWJsZSB0byB1
c2UgS1ZNCnNlbGZ0ZXN0cyB0byBmb3JjZSBhIHNjZW5hcmlvIHdoZXJlIHdlIGNhbiBwcm92ZSBa
YXdycyBkb2VzIGl0cyBqb2IgYW5kCmRvZXMgaXQgd2VsbC4gWzRdIGlzIGEgdGVzdCB3aGljaCBk
b2VzIHRoaXMgYW5kLCBvbiBteSBtYWNoaW5lLCB3aXRob3V0Clphd3JzIGl0IHRha2VzIDE2IHNl
Y29uZHMgdG8gY29tcGxldGUgYW5kIHdpdGggWmF3cnMgaXQgdGFrZXMgMC4yNQpzZWNvbmRzLgoK
VGhpcyBzZXJpZXMgaXMgYWxzbyBhdmFpbGFibGUgaGVyZSBbMV0uIEluIG9yZGVyIHRvIHVzZSBR
RU1VIGZvciB0ZXN0aW5nCmEgYnVpbGQgd2l0aCBbMl0gaXMgbmVlZGVkLiBJbiBvcmRlciB0byBl
bmFibGUgZ3Vlc3RzIHRvIHVzZSBaYXdycyB3aXRoCktWTSB1c2luZyBrdm10b29sLCB0aGUgYnJh
bmNoIGF0IFszXSBtYXkgYmUgdXNlZC4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vam9uZXMtZHJl
dy9saW51eC9jb21taXRzL3Jpc2N2L3phd3JzLXYzLwpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjQwMzEyMTUyOTAxLjUxMjAwMS0yLWFqb25lc0B2ZW50YW5hbWljcm8uY29tLwpb
M10gaHR0cHM6Ly9naXRodWIuY29tL2pvbmVzLWRyZXcva3ZtdG9vbC9jb21taXRzL3Jpc2N2L3ph
d3JzLwpbNF0gaHR0cHM6Ly9naXRodWIuY29tL2pvbmVzLWRyZXcvbGludXgvY29tbWl0L2NiMmJl
Y2NlYmNlY2UxMDg4MWRiODQyZWQ2OWJkZDU3MTVjZmFiNWQKClRoYW5rcywKZHJldwoKdjM6CiAt
IE1vdmVkIGNvbW1lbnQgYWJvdXQgZXhwZWN0ZWQgdGVybWluYXRpb24gZnJvbSB0aGUgRFQgYmlu
ZGluZyB0ZXh0CiAgIHRvIGEgY29kZSBjb21tZW50LgoKdjI6CiAtIEFkZGVkIERUIGJpbmRpbmdz
IHBhdGNoIHdpdGggYWRkaXRpb25hbCBMaW51eCBzcGVjaWZpY2F0aW9ucyBkdWUKICAgdG8gd3Jz
Lm50byBwb3RlbnRpYWxseSBuZXZlciB0ZXJtaW5hdGluZywgYXMgc3VnZ2VzdGVkIGJ5IFBhbG1l
cgogLSBBZGRlZCBwYXRjaCB0byBzaGFyZSBwYXVzZSBpbnNuIGRlZmluaXRpb24KIC0gUmV3b3Jr
IG1haW4gWmF3cnMgc3VwcG9ydCBwYXRjaCB0byB1c2UgQXJtIGFwcHJvYWNoICh3aGljaCBpcwog
ICBhbHNvIHRoZSBhcHByb2FjaCB0aGF0IEFuZHJlYSBQYXJyaSBzdWdnZXN0ZWQpCiAtIERyb3Bw
ZWQgdGhlIHJpc2N2IGltcGxlbWVudGF0aW9uIG9mIHNtcF9jb25kX2xvYWRfYWNxdWlyZSgpLgog
ICBhZmFpY3QsIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uLCB3aGljaCB3aWxsIHVzZSB0aGUg
cmlzY3YKICAgaW1wbGVtZW50YXRpb24gb2Ygc21wX2NvbmRfbG9hZF9yZWxheGVkKCkgaXMgc3Vm
ZmljaWVudCBmb3IgcmlzY3YuCiAtIFRoZSByZXdvcmsgd2FzIGxhcmdlIGVub3VnaCAoSU1PKSB0
byBkcm9wIEhlaWtvJ3Mgcy1vLWIgYW5kIHRvCiAgIGFkZCBteXNlbGYgYXMgYSBjby1kZXZlbG9w
ZXIKCgpBbmRyZXcgSm9uZXMgKDUpOgogIHJpc2N2OiBQcm92aWRlIGEgZGVmaW5pdGlvbiBmb3Ig
J3BhdXNlJwogIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFphd3JzIElTQSBleHRlbnNpb24gZGVz
Y3JpcHRpb24KICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFphd3JzIElTQSBleHRlbnNpb24KICBL
Vk06IHJpc2N2OiBTdXBwb3J0IGd1ZXN0IHdycy5udG8KICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6
IEFkZCBaYXdycyBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKCkNocmlzdG9waCBNw7xs
bG5lciAoMSk6CiAgcmlzY3Y6IEFkZCBaYXdycyBzdXBwb3J0IGZvciBzcGlubG9ja3MKCiBEb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgNCArKwogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgIDcgKysrCiBhcmNoL3Jp
c2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrLS0tCiBhcmNo
L3Jpc2N2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyAtCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2JhcnJpZXIuaCAgICAgICAgICAgICAgfCA0NSArKysrKysrKystLS0t
LQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggICAgICAgICAgICAgIHwgNTggKysr
KysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAg
ICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLWRlZi5oICAgICAgICAg
ICAgIHwgIDQgKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAgICAg
ICB8ICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCAgICAgICB8
ICA4ICstLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCAgICAgICAgIHwg
IDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgIHwgIDEg
KwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgIHwgIDEgKwog
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAgICAgIHwgIDEgKwogYXJj
aC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9y
aXNjdi9rdm0vdmNwdV9pbnNuLmMgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysKIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8ICAyICsKIC4uLi9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8ICA0ICsrCiAxOCBmaWxlcyBj
aGFuZ2VkLCAxNDYgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCgotLSAKMi40NC4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
