Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA93C83F16
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 08:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ovnpg/mty/iTxSgeknhpf6Xo3RCXsthzqIjtOOPjxzk=; b=zZsGEPpFNl1ZP+
	YjQi0BDbVcWylk1QSX75LltS5O6ULSLshFVf2oYcWPs+fN1zdzi7lzVJTPz+nQmptJu3HmeFeHkUO
	e5/6xpB9BilYbOed539LYZUk+iT+F6a8/bqmbdOxM4pPYu2JwWabWA0kHpg5eSkRFmo9GoqD7HP1M
	R9VdMq9RTOdpQNAC8IJW7G2bd11MWD7obf4ECXNeJTW50LNFC4/zYO7tlmcHibjAV8yS31fZJJ/Y4
	4e/rvce9RtKVEEAMii+s+fHbfq4Fn8Qjtt2SUVJuTbL7sJLXmraTfznBygmk15TFs3NLBLdaN92li
	YXUJtE/wYCHrf86uE2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qauDz-00B2xj-2r;
	Tue, 29 Aug 2023 08:37:23 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qauDw-00B2xN-3A
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 08:37:22 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99357737980so526340266b.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693298239; x=1693903039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9iMpNXmIevE0BgwMDd4WWAnKWJLVfTLbZLwahfl61w=;
        b=bHALBVKUf3mzqjp5qBc54g26ErG0SAuQJGsGxNfmi9t4X8AcX1imw+RSpS5Z3Kh6h8
         ZkfFCO6U50LasBNoPW2zybtvb7zbV9y4T5QgXyYGXfSXJF17AW4lL+vt1eosQK4/KEAI
         zcK+Pcoc6yEtAQriLTCNQdPRF09WbFebyIw8+z1M4f3a/rpgdDZr6ofwLAaJukTjfx4X
         TQ92HdRCuqDNpVmSeeAycj931QggLaB+ifyEYj969j89qnKHfIdkVFN7ssU+XWKVY3o9
         Ey4JzgHaVZnyWMZSPgekXDJFuIqRjG4ygfOFH8DEbmfxXPGFrmOeEGF5CAZFzd9ZaFya
         CVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693298239; x=1693903039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9iMpNXmIevE0BgwMDd4WWAnKWJLVfTLbZLwahfl61w=;
        b=cSqfPAGJTa8FkhpOhk5rxj4fCSf/wAW6BTlK1cDjtnIPpB+DEIPFhe462gHVSTOxDC
         VrWyBHc/w3z5eIds5+F2JSDCGCvZWV8NOxe6zTMPHd2XAWw2eNGwaZ1ECHGpzv1WOjF0
         G8YdyAmyUiPZ0cGSIFSeZELXnk9YNY5g78LqlWoHA7y8mq0qKA5tG0ulO+wucXOkLO3S
         +rD9OZ3T6JgOIw2Usmcn57lzO5zKdZi0eTz5gtiinyBZZxon8RylQSfX3mRCEKeWmOaG
         S7Io8W2GiF0BGoGwMa7GCsQf5/bDDfkuIbBrJlS0uW/mWklAQk+pbBaPKsR2meZzaXDm
         7DTA==
X-Gm-Message-State: AOJu0Yy9oo/V+yF4gyaknhkEd+8wl4bOfte8hezvum3KcO0WLR5RIxM+
	nhUnI+3OK0T7bSL5ivNO104=
X-Google-Smtp-Source: AGHT+IG2AEi8AUkfv4qjEMaIGKPkcicN1p+fKc05evfp7vAQ8dWGFeUa2PUha7EV15lGbyxAZQ5UAg==
X-Received: by 2002:a17:906:7699:b0:9a2:1e03:1573 with SMTP id o25-20020a170906769900b009a21e031573mr11068276ejm.65.1693298238863;
        Tue, 29 Aug 2023 01:37:18 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id lx16-20020a170906af1000b0098de7d28c34sm5706257ejb.193.2023.08.29.01.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:37:18 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: bjorn@kernel.org,
	guoren@kernel.org,
	conor.dooley@microchip.com,
	Nam Cao <namcaov@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2] riscv: provide riscv-specific is_trap_insn()
Date: Tue, 29 Aug 2023 10:36:15 +0200
Message-Id: <20230829083614.117748-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_013721_026583_FE7B62E5 
X-CRM114-Status: GOOD (  10.35  )
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

dXByb2JlcyBleHBlY3RzIGlzX3RyYXBfaW5zbigpIHRvIHJldHVybiB0cnVlIGZvciBhbnkgdHJh
cCBpbnN0cnVjdGlvbnMsCm5vdCBqdXN0IHRoZSBvbmUgdXNlZCBmb3IgaW5zdGFsbGluZyB1cHJv
YmUuIFRoZSBjdXJyZW50IGRlZmF1bHQKaW1wbGVtZW50YXRpb24gb25seSByZXR1cm5zIHRydWUg
Zm9yIDE2LWJpdCBjLmVicmVhayBpZiBDIGV4dGVuc2lvbiBpcwplbmFibGVkLiBUaGlzIGNhbiBj
b25mdXNlIHVwcm9iZXMgaWYgYSAzMi1iaXQgZWJyZWFrIGdlbmVyYXRlcyBhIHRyYXAKZXhjZXB0
aW9uIGZyb20gdXNlcnNwYWNlOiB1cHJvYmVzIGFza3MgaXNfdHJhcF9pbnNuKCkgd2hvIHNheXMg
dGhlcmUgaXMgbm8KdHJhcCwgc28gdXByb2JlcyBhc3N1bWUgYSBwcm9iZSB3YXMgdGhlcmUgYmVm
b3JlIGJ1dCBoYXMgYmVlbiByZW1vdmVkLCBhbmQKcmV0dXJuIHRvIHRoZSB0cmFwIGluc3RydWN0
aW9uLiBUaGlzIGNhdXNlcyBhbiBpbmZpbml0ZSBsb29wIG9mIGVudGVyaW5nCmFuZCBleGl0aW5n
IHRyYXAgaGFuZGxlci4KCkluc3RlYWQgb2YgdXNpbmcgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRp
b24sIGltcGxlbWVudCB0aGlzIGZ1bmN0aW9uCnNwZWZpY2lhbGx5IGZvciByaXNjdiB3aXRoIGNo
ZWNrcyBmb3IgYm90aCBlYnJlYWsgYW5kIGMuZWJyZWFrLgoKRml4ZXM6IDc0Nzg0MDgxYWFjOCAo
InJpc2N2OiBBZGQgdXByb2JlcyBzdXBwb3J0ZWQiKQpTaWduZWQtb2ZmLWJ5OiBOYW0gQ2FvIDxu
YW1jYW92QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2lu
Yy5jb20+Ci0tLQp2MjogcmVtb3ZlICNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX0MgKEd1byBSZW4p
CgogYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyB8IDYgKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL3Vwcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMKaW5k
ZXggMTk0ZjE2NmIyY2M0Li40YjNkYzhiZWFmNzcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Jlcy91cHJvYmVzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9i
ZXMuYwpAQCAtMyw2ICszLDcgQEAKICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+CiAjaW5jbHVk
ZSA8bGludXgvcHRyYWNlLmg+CiAjaW5jbHVkZSA8bGludXgvdXByb2Jlcy5oPgorI2luY2x1ZGUg
PGFzbS9pbnNuLmg+CiAKICNpbmNsdWRlICJkZWNvZGUtaW5zbi5oIgogCkBAIC0xNyw2ICsxOCwx
MSBAQCBib29sIGlzX3N3YnBfaW5zbih1cHJvYmVfb3Bjb2RlX3QgKmluc24pCiAjZW5kaWYKIH0K
IAorYm9vbCBpc190cmFwX2luc24odXByb2JlX29wY29kZV90ICppbnNuKQoreworCXJldHVybiBy
aXNjdl9pbnNuX2lzX2VicmVhaygqaW5zbikgfHwgcmlzY3ZfaW5zbl9pc19jX2VicmVhaygqaW5z
bik7Cit9CisKIHVuc2lnbmVkIGxvbmcgdXByb2JlX2dldF9zd2JwX2FkZHIoc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MpCiB7CiAJcmV0dXJuIGluc3RydWN0aW9uX3BvaW50ZXIocmVncyk7Ci0tIAoyLjM0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
