Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC985C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hR3Ia0lUEDK9v2t69WHiUMBKt+Zvge/TI/Mk9+FtGNA=; b=tteC9XKuEzF4Kl
	TYktzWyJkyB9iavdtjXBfRsaBQpMivdb5GqYvQuNdYms+NUK33DutAOj6IxWSftPnQ7769f78y/+7
	Quhb4VKOq8Z2apk2sB/Zu+PPRKVdLlxDSBDp6vmTctw1WsYdOD1sPHJ8ndB1+lTUZhtco+ZCofNmu
	+C+wDTs+uasfN8zz78QbYqK5cmugpK3FR0gSeDfJTmmGvOHueI+wXacQGrRZ2nWLzVJf0k8hVyBhC
	0hO9E3TyEc4+sshZaPRLsjOr8g212pc0XRSxsj/hsZQi+BOutpBIrR4kxiHqC5fg7gXTmUx3Rjeb+
	Tntn5ZnfMRBGIb+EMP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAj4-0000000FdVS-08mu;
	Fri, 12 Apr 2024 06:49:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAiz-0000000FdRZ-4AIA
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e2bbc2048eso5360395ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904565; x=1713509365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHRXW9BfVlGJGTuBqz21x9jZhOCb5ENaxkoeEzRsV8g=;
        b=QxSKWsVLZHQfCv3lfmu/wWz0Q1UcCN6vlOfhUhH2TZSSq1X0832BUMly4A7jHv0eIm
         z3fnrmOgQorpbeu957th9i3NbFZJyno0wnmQYcNbPJzmlHCsED1ldNefkgMgpcI2gOTU
         hQppqwKknDoIWDcKoH0R/4lCfO8/ClScjWYSZMfvdeaebrDVTY9YfCUUF1L2ycuXwvGi
         v0f2YJIxI4bom9Nf5GHsD5at7n87c63cKXjivXfAOydyA9ANOhszqL0uqAujcwzJqxii
         IeouLHXX0B+WbRoVq4n6V7q4KKc/GijfKZLO0O6hUvqXoTq8DU50CJeqcBLL8HzsLfDN
         Waeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904565; x=1713509365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHRXW9BfVlGJGTuBqz21x9jZhOCb5ENaxkoeEzRsV8g=;
        b=vxAzBkqptpiuqQJjZNF0ksqMqOEcDd0/VNcfVAjwxKa6wyA2jIQJWuP+9NKkkjlh/i
         72SVbru3xHZ1Ez2qy/3xGno0f3FiDyvQgZ36XXFJDydsrxYSbjUZdweq8ZNVg8rPEYp5
         yB6hyIhgG2xmnmyoVMNAYhRghMpeVY5uVxGK2baV1Xi0Xdmfyuk+3ULuxgxyREasXXH7
         VJ5Yu5wY84BCIe1Q8PWkcro72TN5FvnZ0Kws4btG4QDMloS6PmBo+bCuH9RWZGDgkQqv
         diGpZoLIqCsg7MepkvToFIy9CG+C3jC2LTGyRW9StpZ/h2R9LSFaogRvg8Fs2YNOrKGy
         l2dQ==
X-Gm-Message-State: AOJu0YxnyqAcQl08ZPkNk5u312xzLLbD+oe/QvAova/n3jt2HECvrqRL
	gCDAZQ9WCHNwC8kkx4RwYpCPIEmAkBU7lRbOhHGvrydHrvI2YqZ7CQL11DXqbFI=
X-Google-Smtp-Source: AGHT+IF7aPtREGbQgxU3TxWKZAFkNQpbZfw9mJVRZm3GBajMC7PPTHtPXu4zJ9ZgxwJ5Yt7MgcH+hA==
X-Received: by 2002:a17:902:9a09:b0:1e2:7fb2:b08 with SMTP id v9-20020a1709029a0900b001e27fb20b08mr1486377plp.43.1712904564631;
        Thu, 11 Apr 2024 23:49:24 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:24 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:49:02 +0800
Subject: [PATCH v4 6/9] riscv: hwprobe: add zve Vector subextensions into
 hwprobe interface
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-6-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_234926_323326_2E13E243 
X-CRM114-Status: GOOD (  10.47  )
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

VGhlIGZvbGxvd2luZyBWZWN0b3Igc3ViZXh0ZW5zaW9ucyBmb3IgImVtYmVkZGVkIiBwbGF0Zm9y
bXMgYXJlIGFkZGVkCmludG8gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wOgogLSBaVkUzMlgK
IC0gWlZFMzJGCiAtIFpWRTY0WAogLSBaVkU2NEYKIC0gWlZFNjRECgpFeHRlbnNpb25zIGVuZGlu
ZyB3aXRoIGFuIFggaW5kaWNhdGVzIHRoYXQgdGhlIHBsYXRmb3JtIGRvZXNuJ3QgaGF2ZSBhCnZl
Y3RvciBGUFUuCkV4dGVuc2lvbnMgZW5kaW5nIHdpdGggRi9EIG1lYW4gdGhhdCB3aGV0aGVyIHNp
bmdsZSAoRikgb3IgZG91YmxlIChEKQpwcmVjaXNpb24gdmVjdG9yIG9wZXJhdGlvbiBpcyBzdXBw
b3J0ZWQuClRoZSBudW1iZXIgMzIgb3IgNjQgZm9sbG93cyBmcm9tIFpWRSB0ZWxscyB0aGUgbWF4
aW11bSBlbGVtZW50IGxlbmd0aC4KClNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1
QHNpZml2ZS5jb20+ClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Ci0tLQpDaGFuZ2Vsb2cgdjI6CiAtIHp2ZSogZXh0ZW5zaW9ucyBpbiBod3Byb2JlIGRl
cGVuZHMgb24gd2hldGhlciBrZXJuZWwgc3VwcG9ydHMgdiwgc28KICAgaW5jbHVkZSB0aGVtIGFm
dGVyIGhhc192ZWN0b3IoKS4gRml4IGEgdHlwby4gKENsw6ltZW50KQotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCAxNSArKysrKysrKysrKysrKysKIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgNSArKysrKwogYXJjaC9yaXNjdi9rZXJu
ZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8ICA1ICsrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggYjJiY2M5
ZWVkOWFhLi5kMGIwMmUwMTJlNWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QK
QEAgLTE4OCw2ICsxODgsMjEgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAg
ICAgIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA5NWNmMWY5ICgiQWRkIGNoYW5nZXMgcmVx
dWVzdGVkIGJ5IFZlZAogICAgICAgIGR1cmluZyBzaWdub2ZmIikKIAorICAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX0VYVF9aVkUzMlhgOiBUaGUgVmVjdG9yIHN1Yi1leHRlbnNpb24gWnZlMzJ4
IGlzCisgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5IHZlcnNpb24gMS4wIG9mIHRoZSBSSVND
LVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9FWFRfWlZFMzJGYDogVGhlIFZlY3RvciBzdWItZXh0ZW5zaW9uIFp2ZTMyZiBpcworICAgIHN1
cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBl
eHRlbnNpb24gbWFudWFsLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTY0
WGA6IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmU2NHggaXMKKyAgICBzdXBwb3J0ZWQsIGFz
IGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1h
bnVhbC4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkU2NEZgOiBUaGUgVmVj
dG9yIHN1Yi1leHRlbnNpb24gWnZlNjRmIGlzCisgICAgc3VwcG9ydGVkLCBhcyBkZWZpbmVkIGJ5
IHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbiBtYW51YWwuCisKKyAg
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjREYDogVGhlIFZlY3RvciBzdWItZXh0
ZW5zaW9uIFp2ZTY0ZCBpcworICAgIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieSB2ZXJzaW9uIDEu
MCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgorCiAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJm
b3JtYW5jZQogICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3Nv
cnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDlmMmE4ZTNmZjIw
NC4uYjlhMDg3NmU5NjlmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
aHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAg
LTU5LDYgKzU5LDExIEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pUU08JCSgxVUxMIDw8IDMzKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRf
WkFDQVMJCSgxVUxMIDw8IDM0KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgx
VUxMIDw8IDM1KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZFMzJYCSgxVUxMIDw8IDM2
KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZFMzJGCSgxVUxMIDw8IDM3KQorI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjRYCSgxVUxMIDw8IDM4KQorI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWlZFNjRGCSgxVUxMIDw8IDM5KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWlZFNjRECSgxVUxMIDw8IDQwKQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJG
XzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkK
ICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3N5c19od3Byb2JlLmMKaW5kZXggOGNhZTQxYTUwMmRkLi5jODIxOWI4MmZiZmMgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYwpAQCAtMTEzLDYgKzExMywxMSBAQCBzdGF0aWMgdm9pZCBod3By
b2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlFWFRfS0VZKFpJQ09O
RCk7CiAKIAkJaWYgKGhhc192ZWN0b3IoKSkgeworCQkJRVhUX0tFWShaVkUzMlgpOworCQkJRVhU
X0tFWShaVkUzMkYpOworCQkJRVhUX0tFWShaVkU2NFgpOworCQkJRVhUX0tFWShaVkU2NEYpOwor
CQkJRVhUX0tFWShaVkU2NEQpOwogCQkJRVhUX0tFWShaVkJCKTsKIAkJCUVYVF9LRVkoWlZCQyk7
CiAJCQlFWFRfS0VZKFpWS0IpOwoKLS0gCjIuNDQuMC5yYzIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
