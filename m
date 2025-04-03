Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47EEC3601B
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kspWii5VLxKrVVr7TSNs4pSt7CGKCRplqMnUQCXwQN4=; b=MirJYqVbv8hd3H
	Q3O4F/bjhHR6Etb6gRdpwTVb2tyS9CJA6xDlUR99LN3hsxI/D07+JRAS4OWbelhzSTzZ9VvDlz1BL
	PQfoDs0O3ytb2Y+o6hAidY0vAFA5hDewsXeP9AywDotzDSdnyzzyMlHJDaGqyyCxCsTPHUbm4oleN
	NFe5CGgXjIKtImrut6cdOHXenq0YBCxct5jPqGCt30g6R8pX6mDubB/2xU/uXHGWf8Vxxjg8D6lNE
	go4QMNzLz3z8usnYkQ4RwRF9LpteKPqaS7pIxXAMEFdXH1IMvec0BYT65Gz0Kyxiu+9MDeX6TSISC
	uQx8QgOpwuLKLbBWotWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ItF-00000008jUW-1SqM;
	Thu, 03 Apr 2025 11:37:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Inx-00000008iU3-1BWz
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 11:32:18 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3913290f754so61888f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Apr 2025 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679936; x=1744284736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4I41IipITScJpjVRL6TprMAJ/XjTheyblDpzSa8c88=;
        b=V7dXZ0kZLsccQvOxjQ0zUWbkF9RwE9v/jtb/6QJzBy0BO1RAXoMIpqHTSxvhihTO1W
         YeL8JYGrCSI2SvFGk5V+dC7Y1Q8I5lsB0oQMvPIk2si6bm43RLysSMOuMvUoP3oO6uH0
         oIFshU/iY1nNJaiVb3UnT4rdzFFSUIfytvqMPxNsCuJnr8lAslGpknEjBSAoYxMAoWqz
         ZdUFRYElCbHHHEgoBme0mVEhV5YZ2ZP5Dw5360Xcni6MEi5IUxjaSfgkKERM87pkHFpO
         EjxpCST9dZ0J7jTeiyQvXW08tvjk3+UC1tMA9t9PgGdb9MyXcmLQdYUOXZahDQOAUdEc
         WWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679936; x=1744284736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4I41IipITScJpjVRL6TprMAJ/XjTheyblDpzSa8c88=;
        b=dYoW4BmwYomuUsYQTT0Ubn9HcDLZL4+D3qN7+UNdL9Bzj0VVfg1WBU7m27HgqoO6ZU
         dWTV9zRGrf2Qmoteq9xe1vx/8LLcf1gqoVDLLgYyhLeu9CTFC+mOUdAzYbtirW/9vJXV
         lCsUsaZrF5aYBkNH6RL7Nsf9+ojEF5mr/Mjv7TtsfpcXoM7+o9J/kQGBBRCpP8QHcABI
         JvP0C9TYfnip5X/F7jrthhBH61kFeG5RfNtd3QVMmPaL9/V/lNHnSlrringVWjnuDXs7
         dhyEa3Ise920288mFfu0L6k822puDYiZg6lTsV7ia9UXuY/aFLaTA9gTfnHYeHdLoPvS
         4qKg==
X-Forwarded-Encrypted: i=1; AJvYcCW0bj1a7b/DETOuqOIeCHrGq952HSNe+qsDVvNYS5/kyaaWbf+LcYKTYGqtATXZszkfhGKT5zW/lMT+mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbH72dxHay/JMU/oC06awpljSW7MUOLqmJKv5ufKMRZuJ4mGoN
	dIZZJrPqZNoJEnr6abQ3m3F/AllEJbqH/w/d3jRaLMWC/0GMQI6WaJjlvMV8GK0=
X-Gm-Gg: ASbGncu7DtEs0dmlbP7k+tF71iwuCAir7Q7RmO71M9EeHdVZOoQxQoPoKNXe45H/EDR
	ctQSaBiDUtdr9McNINPnNJUmPLJgQc1Q9yLJG4VFe9/nhmHpRVTRegCWyTJ6TJP7WiqGmFX6DQU
	zUNGFpni7vAlknnlUq6tmX+oErHguQIvQUgFDpzHlqZmb6XGyRbN25jOMX/fjTpqzljb86HW/DQ
	E0Hv5glEVCYBx0CoA+dXk3mMZp6Ue1nXAT4URNnJJ78Alz08X6I11D9xHcGxkteUVmgoFXDxP3L
	SGysj4qHIWVM4PiLISlwSw0wpKb+TYJI4YUC9lS8HUNnuI4MIvzJ1OVHpj6Wg1bavWJrzIzJhrT
	Q4Q==
X-Google-Smtp-Source: AGHT+IG37Xf9B62VUcljGsX2nc8emFPUfOIiPgop6kaEA0XU1nktX/EDvfLlLGCqE6Qni7LwKqU1Ng==
X-Received: by 2002:a5d:59ad:0:b0:39c:1258:17d5 with SMTP id ffacd0b85a97d-39c2483abcfmr3137958f8f.14.1743679935688;
        Thu, 03 Apr 2025 04:32:15 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm1575928f8f.62.2025.04.03.04.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:14 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
Date: Thu,  3 Apr 2025 13:25:23 +0200
Message-ID: <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043217_324932_9658506A 
X-CRM114-Status: GOOD (  23.75  )
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

QmV3YXJlLCB0aGlzIHBhdGNoIGlzICJicmVha2luZyIgdGhlIHVzZXJzcGFjZSBpbnRlcmZhY2Us
IGJlY2F1c2UgaXQKZml4ZXMgYSBLVk0vUUVNVSBidWcgd2hlcmUgdGhlIGJvb3QgVkNQVSBpcyBu
b3QgYmVpbmcgcmVzZXQgYnkgS1ZNLgoKVGhlIFZDUFUgcmVzZXQgcGF0aHMgYXJlIGluY29uc2lz
dGVudCByaWdodCBub3cuICBLVk0gcmVzZXRzIFZDUFVzIHRoYXQKYXJlIGJyb3VnaHQgdXAgYnkg
S1ZNLWFjY2VsZXJhdGVkIFNCSSBjYWxscywgYnV0IGRvZXMgbm90aGluZyBmb3IgVkNQVXMKYnJv
dWdodCB1cCB0aHJvdWdoIGlvY3Rscy4KCldlIG5lZWQgdG8gcGVyZm9ybSBhIEtWTSByZXNldCBl
dmVuIHdoZW4gdGhlIFZDUFUgaXMgc3RhcnRlZCB0aHJvdWdoIGFuCmlvY3RsLiAgVGhpcyBwYXRj
aCBpcyBvbmUgb2YgdGhlIHdheXMgd2UgY2FuIGFjaGlldmUgaXQuCgpBc3N1bWUgdGhhdCB1c2Vy
c3BhY2UgaGFzIG5vIGJ1c2luZXNzIHNldHRpbmcgdGhlIHBvc3QtcmVzZXQgc3RhdGUuCktWTSBp
cyBkZS1mYWN0byB0aGUgU0JJIGltcGxlbWVudGF0aW9uLCBhcyB0aGUgU0JJIEhTTSBhY2NlbGVy
YXRpb24KY2Fubm90IGJlIGRpc2FibGVkIGFuZCB1c2Vyc3BhY2UgY2Fubm90IGNvbnRyb2wgdGhl
IHJlc2V0IHN0YXRlLCBzbyBLVk0Kc2hvdWxkIGJlIGluIGZ1bGwgY29udHJvbCBvZiB0aGUgcG9z
dC1yZXNldCBzdGF0ZS4KCkRvIG5vdCByZXNldCB0aGUgcGMgYW5kIGExIHJlZ2lzdGVycywgYmVj
YXVzZSBTQkkgcmVzZXQgaXMgZXhwZWN0ZWQgdG8KcHJvdmlkZSB0aGVtIGFuZCBLVk0gaGFzIG5v
IGlkZWEgd2hhdCB0aGVzZSByZWdpc3RlcnMgc2hvdWxkIGJlIC0tIG9ubHkKdGhlIHVzZXJzcGFj
ZSBrbm93cyB3aGVyZSBpdCBwdXQgdGhlIGRhdGEuCgpBbiBpbXBvcnRhbnQgY29uc2lkZXJhdGlv
biBpcyByZXN1bWUuICBVc2Vyc3BhY2UgbWlnaHQgd2FudCB0byBzdGFydAp3aXRoIG5vbi1yZXNl
dCBzdGF0ZS4gIENoZWNrIHJhbl9hdGxlYXN0X29uY2UgdG8gYWxsb3cgdGhpcywgYmVjYXVzZQpL
Vk0tU0JJIEhTTSBjcmVhdGVzIHNvbWUgVkNQVXMgYXMgU1RPUFBFRC4KClRoZSBkcmF3YmFjayBp
cyB0aGF0IHVzZXJzcGFjZSBjYW4gc3RpbGwgc3RhcnQgdGhlIGJvb3QgVkNQVSB3aXRoIGFuCmlu
Y29ycmVjdCByZXNldCBzdGF0ZSwgYmVjYXVzZSB0aGVyZSBpcyBubyB3YXkgdG8gZGlzdGluZ3Vp
c2ggYSBmcmVzaGx5CnJlc2V0IG5ldyBWQ1BVIG9uIHRoZSBLVk0gc2lkZSAodXNlcnNwYWNlIG1p
Z2h0IHNldCBzb21lIHZhbHVlcyBieQptaXN0YWtlKSBmcm9tIGEgcmVzdG9yZWQgVkNQVSAodXNl
cnNwYWNlIG11c3Qgc2V0IGFsbCB2YWx1ZXMpLgoKVGhlIGFkdmFudGFnZSBvZiB0aGlzIHNvbHV0
aW9uIGlzIHRoYXQgaXQgZml4ZXMgY3VycmVudCBRRU1VIGFuZCBtYWtlcwpzb21lIHNlbnNlIHdp
dGggdGhlIGFzc3VtcHRpb24gdGhhdCBLVk0gaW1wbGVtZW50cyBTQkkgSFNNLgpJIGRvIG5vdCBs
aWtlIGl0IHRvbyBtdWNoLCBzbyBJJ2QgYmUgaW4gZmF2b3Igb2YgYSBkaWZmZXJlbnQgc29sdXRp
b24gaWYKd2UgY2FuIHN0aWxsIGFmZm9yZCB0byBkcm9wIHN1cHBvcnQgZm9yIGN1cnJlbnQgdXNl
cnNwYWNlcy4KCkZvciBhIGNsZWFuZXIgc29sdXRpb24sIHdlIHNob3VsZCBhZGQgaW50ZXJmYWNl
cyB0byBwZXJmb3JtIHRoZSBLVk0tU0JJCnJlc2V0IHJlcXVlc3Qgb24gdXNlcnNwYWNlIGRlbWFu
ZC4gIEkgdGhpbmsgaXQgd291bGQgYWxzbyBiZSBtdWNoIGJldHRlcgppZiB1c2Vyc3BhY2Ugd2Fz
IGluIGNvbnRyb2wgb2YgdGhlIHBvc3QtcmVzZXQgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBSYWRp
bSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmggICAgIHwgIDEgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fdmNwdV9zYmkuaCB8ICAzICsrKwogYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICB8ICA5ICsrKysrKysrKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgICAg
ICB8IDIxICsrKysrKysrKysrKysrKysrKystLQogNCBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAw
YzhjOWMwNWFmOTEuLjliYmY4YzRhMjg2YiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApA
QCAtMTk1LDYgKzE5NSw3IEBAIHN0cnVjdCBrdm1fdmNwdV9zbXN0YXRlZW5fY3NyIHsKIAogc3Ry
dWN0IGt2bV92Y3B1X3Jlc2V0X3N0YXRlIHsKIAlzcGlubG9ja190IGxvY2s7CisJYm9vbCBhY3Rp
dmU7CiAJdW5zaWduZWQgbG9uZyBwYzsKIAl1bnNpZ25lZCBsb25nIGExOwogfTsKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCmluZGV4IGFhYWE4MTM1NTI3Ni4uMmMzMzRhODdlMDJh
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKQEAgLTU3LDYgKzU3LDkgQEAg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfc3lzdGVtX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwKIAkJCQkgICAgIHUzMiB0eXBlLCB1NjQgZmxhZ3MpOwogdm9pZCBrdm1fcmlzY3ZfdmNwdV9z
YmlfcmVxdWVzdF9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGMsIHVuc2lnbmVkIGxvbmcgYTEp
Owordm9pZCBfX2t2bV9yaXNjdl92Y3B1X3NldF9yZXNldF9zdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgcGMsIHVuc2lnbmVkIGxvbmcgYTEpOwordm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfcmVxdWVz
dF9yZXNldF9mcm9tX3VzZXJzcGFjZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogaW50IGt2bV9y
aXNjdl92Y3B1X3NiaV9yZXR1cm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1
biAqcnVuKTsKIGludCBrdm1fcmlzY3ZfdmNwdV9zZXRfcmVnX3NiaV9leHQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAogCQkJCSAgIGNvbnN0IHN0cnVjdCBrdm1fb25lX3JlZyAqcmVnKTsKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRl
eCBiODQ4NWMxYzFjZTQuLjQ1Nzg4NjNhMzllMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtNTgsNiArNTgsMTEgQEAgc3Rh
dGljIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfY29udGV4dF9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCiAJc3RydWN0IGt2bV92Y3B1X3Jlc2V0X3N0YXRlICpyZXNldF9zdGF0ZSA9ICZ2Y3B1LT5h
cmNoLnJlc2V0X3N0YXRlOwogCXZvaWQgKnZlY3Rvcl9kYXRhcCA9IGNudHgtPnZlY3Rvci5kYXRh
cDsKIAorCXNwaW5fbG9jaygmcmVzZXRfc3RhdGUtPmxvY2spOworCWlmICghcmVzZXRfc3RhdGUt
PmFjdGl2ZSkKKwkJX19rdm1fcmlzY3ZfdmNwdV9zZXRfcmVzZXRfc3RhdGUodmNwdSwgY250eC0+
c2VwYywgY250eC0+YTEpOworCXNwaW5fdW5sb2NrKCZyZXNldF9zdGF0ZS0+bG9jayk7CisKIAlt
ZW1zZXQoY250eCwgMCwgc2l6ZW9mKCpjbnR4KSk7CiAJbWVtc2V0KGNzciwgMCwgc2l6ZW9mKCpj
c3IpKTsKIApAQCAtNTIwLDYgKzUyNSwxMCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRf
bXBzdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAKIAlzd2l0Y2ggKG1wX3N0YXRlLT5tcF9z
dGF0ZSkgewogCWNhc2UgS1ZNX01QX1NUQVRFX1JVTk5BQkxFOgorCQlpZiAocmlzY3ZfdmNwdV9z
dXBwb3J0c19zYmlfZXh0KHZjcHUsIEtWTV9SSVNDVl9TQklfRVhUX0hTTSkgJiYKKwkJCQl2Y3B1
LT5hcmNoLnJhbl9hdGxlYXN0X29uY2UgJiYKKwkJCQlrdm1fcmlzY3ZfdmNwdV9zdG9wcGVkKHZj
cHUpKQorCQkJa3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3RfcmVzZXRfZnJvbV91c2Vyc3BhY2Uo
dmNwdSk7CiAJCVdSSVRFX09OQ0UodmNwdS0+YXJjaC5tcF9zdGF0ZSwgKm1wX3N0YXRlKTsKIAkJ
YnJlYWs7CiAJY2FzZSBLVk1fTVBfU1RBVEVfU1RPUFBFRDoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCmluZGV4IDNkNzk1
NWUwNWNjMy4uNzdmOWYwYmQzODQyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKQEAgLTE1NiwxMiArMTU2LDI5IEBA
IHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N5c3RlbV9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCiAJcnVuLT5leGl0X3JlYXNvbiA9IEtWTV9FWElUX1NZU1RFTV9FVkVOVDsKIH0KIAorLyog
bXVzdCBiZSBjYWxsZWQgd2l0aCBoZWxkIHZjcHUtPmFyY2gucmVzZXRfc3RhdGUubG9jayAqLwor
dm9pZCBfX2t2bV9yaXNjdl92Y3B1X3NldF9yZXNldF9zdGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
cGMsIHVuc2lnbmVkIGxvbmcgYTEpCit7CisJdmNwdS0+YXJjaC5yZXNldF9zdGF0ZS5hY3RpdmUg
PSB0cnVlOworCXZjcHUtPmFyY2gucmVzZXRfc3RhdGUucGMgPSBwYzsKKwl2Y3B1LT5hcmNoLnJl
c2V0X3N0YXRlLmExID0gYTE7Cit9CisKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3Rf
cmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBjLCB1bnNpZ25lZCBsb25nIGExKQogewogCXNwaW5f
bG9jaygmdmNwdS0+YXJjaC5yZXNldF9zdGF0ZS5sb2NrKTsKLQl2Y3B1LT5hcmNoLnJlc2V0X3N0
YXRlLnBjID0gcGM7Ci0JdmNwdS0+YXJjaC5yZXNldF9zdGF0ZS5hMSA9IGExOworCV9fa3ZtX3Jp
c2N2X3ZjcHVfc2V0X3Jlc2V0X3N0YXRlKHZjcHUsIHBjLCBhMSk7CisJc3Bpbl91bmxvY2soJnZj
cHUtPmFyY2gucmVzZXRfc3RhdGUubG9jayk7CisKKwlrdm1fbWFrZV9yZXF1ZXN0KEtWTV9SRVFf
VkNQVV9SRVNFVCwgdmNwdSk7Cit9CisKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3JlcXVlc3Rf
cmVzZXRfZnJvbV91c2Vyc3BhY2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXNwaW5fbG9j
aygmdmNwdS0+YXJjaC5yZXNldF9zdGF0ZS5sb2NrKTsKKwl2Y3B1LT5hcmNoLnJlc2V0X3N0YXRl
LmFjdGl2ZSA9IGZhbHNlOwogCXNwaW5fdW5sb2NrKCZ2Y3B1LT5hcmNoLnJlc2V0X3N0YXRlLmxv
Y2spOwogCiAJa3ZtX21ha2VfcmVxdWVzdChLVk1fUkVRX1ZDUFVfUkVTRVQsIHZjcHUpOwotLSAK
Mi40OC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
