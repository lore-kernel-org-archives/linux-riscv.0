Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70FCC5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pokLfkj4gEqpQOxSPgGbJmlWGpn3BTT30E45RRiGEaM=; b=oMxnOyEPbU7nuW
	toZGoFJxI3QfFtdBRCBrZ2rPkYye+UbnyKfIqaLnoWHrO/bW0+n260TP0lmAcTl7cse/4+HduT96w
	JMid7XIq6CoalNmDmpbTP15GzKJj+9DWzWxkrYYUTAatkVpaNgSOZu5+yntzbabl9m40Um1xB3T9u
	R7TDUbWFakAVpCh0hManFfFG76JOAogaPhrCDX4x7PpIk5VH8K2C2oqxsSR/EhEvv5Cj8jkEfe1Du
	Bofd7ceqM7vgR8Yk/QsK+jQxkuxclEYSVvC4X5mg6ggpJqwrYiPuNMRSqn81lCF0E2Pis22Zj7d9L
	6vQnNPnJfmoNzvl2wdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCT-00000007G10-3qtY;
	Fri, 07 Aug 2026 07:41:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCR-00000007FyF-0Bnh
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:41:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso923534f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088461; x=1786693261; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hJeYOt804451rzDFy0He69vDtZSRNQGd+4J9yYwV0Co=;
        b=QDPy9Zgacel6k0yZ8pbv7xZOV65AHjJb88gfgPLY6x+yNoYUanNhfBn07RYpKBkGwh
         qaqrPwNYGSfWc/MShrzW13dZwidC0UsRYPbVwYXoKTGOlo5MLJQWLzlkLGmoknFUySsj
         3V6bgblsMAZjYe9mXuah4b41t08x2MfFtRO9cfy/tvXjQsdlYafT0Om++VyEaN3zHgFE
         w/nDwYYiX1dBdggF8+C9P3xxUSYQy3ElllNQ1JdvtgbCKNlhDmICOXlqhtvjAgoMD43d
         5dHsIOHV8FJyBzHaowzQYMBPm84mtbGopQUz+eK1eag8bKqzfwoYP1cMCppgYRK/SIpM
         ++JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088461; x=1786693261;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJeYOt804451rzDFy0He69vDtZSRNQGd+4J9yYwV0Co=;
        b=FBZpnRCV3ZkcjqX39tXTlQCIH2JMYCuGrO6is63SPxJKRsEp6P2PD03CGBnfm+DTKZ
         XmW2EAjWbkxj4FnzKn1Oq0ZFTBpRxJcLxglCHug98qoP8zVudg2+Y+5wiGSSvLFQMT8w
         eRpa6PSkmJrmjMzuS8X6vD9YxOT95tQKlf7v3bbX6WaMryfOfH9dSkMO4gsAHsEBZFKm
         6T/8XXMS8qwSOfkQv65U593SP8Iui/KTNsB0dxlUfj9nMDj+XBq66jr4Ck3ZdST200YO
         r6yeSLBMbqIn+GgzOABCryRJEu3TyByriwlln/kIaib+23LAt6pXCuUCh+WWaEc9C4Cu
         8t1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp7bjijXbwshVYI3Yzk6vwLmbMuI5y2pxwox+1VK+AkwM2nMFIT79lwSl0vITDogYen1yLhRI5MqJ/W6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkOUE1IK69dH5Dfo9isIJO8fM6cNxOMMJ+OeWxEmJqv1Olb7Yk
	M8Du2roUn4WHZR6+pX2ofdSQwVzn1LnBtP8YhiBCNXQPORlS9GnrPzYz7e8fS/W7ujr9
X-Gm-Gg: AR+sD11CMxcAEiTVcOurr18zXAlXSRKHXdVdst+kpMWCbbNJQym5iN05CoDnCMjvd2b
	TcuAmtLqTTxwRuiVdHIQ+TlkUm8qauDotB3gSfI5DKufVAGS2cg5j1c9D61WPtY+Nhv0q1SzUJO
	ci1xIlcNl74JQW3sZog9Ro0RvSPlpXgKXtWJxsgddRwt0QjhJxWO0VTiXyraxQ/CUFSpcHtpsAx
	9ZsvQX4VZcS3fMDeGe8ZCBYxqspZ0it2tMYE3NJMklwW3/i+Rala34jUB+IOMU1DSoI36krt/rN
	R6ew4HTtxOjPkLxr7YslvaK0ufDFYslHHngK2OJLOi/cDkJE/z2HY39VJMuPKtJUwF0IK9SCsTI
	AJSvtYz/HEYdh0EJBzmQrq58n0Oi9UmXhPLhJMz6P/1L5QS2GF4mRdJYbfQSvG/XZkcPJi41w+f
	y1NW8ruk/P1DtM2lLUie2TNTgEe3KeL2M4sqmW0Po3P5WKNgO2NDU+4WmAzgZF0W8=
X-Received: by 2002:a05:6000:2586:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-47fec62e2b4mr28868834f8f.20.1786088461227;
        Fri, 07 Aug 2026 00:41:01 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:00 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 3/6] dt-bindings: bao: add I/O dispatcher device
Date: Fri,  7 Aug 2026 08:39:30 +0100
Message-ID: <41e65cbe88021964afe55d9e3884ebc199928264.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004103_412687_B907007C 
X-CRM114-Status: GOOD (  13.33  )
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

QWRkIHRoZSBkZXZpY2UtdHJlZSBiaW5kaW5nIGZvciB0aGUgQmFvIEkvTyBkaXNwYXRjaGVyLCBw
cmVzZW50IGluCmJhY2tlbmQgVk1zIHRoYXQgc2VydmljZSBwYXJhdmlydHVhbGlzZWQgKFZpcnRJ
TykgSS9PIG9uIGJlaGFsZiBvZgpmcm9udGVuZCBndWVzdHMuCgpDby1kZXZlbG9wZWQtYnk6IEpv
c8OpIE1hcnRpbnMgPGpvc2VAb3N5eC50ZWNoPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBNYXJ0aW5z
IDxqb3NlQG9zeXgudGVjaD4KQ28tZGV2ZWxvcGVkLWJ5OiBEYXZpZCBDZXJkZWlyYSA8ZGF2aWRt
Y2VyZGVpcmFAb3N5eC50ZWNoPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBDZXJkZWlyYSA8ZGF2aWRt
Y2VyZGVpcmFAb3N5eC50ZWNoPgpTaWduZWQtb2ZmLWJ5OiBKb8OjbyBQZWl4b3RvIDxqcGVpeG90
b0Bvc3l4LnRlY2g+Ci0tLQp2MzoKLSBNb2RlbCBvbmUgbm9kZSBwZXIgYmFja2VuZCBkZXZpY2Ug
KHNpbmdsZSByZWcgKyBzaW5nbGUgaW50ZXJydXB0ICsKICAiYmFvLGlkIikgaW5zdGVhZCBvZiBh
IHNpbmdsZSBub2RlIGRlc2NyaWJpbmcgbWFueSBkZXZpY2VzLCBmb2xsb3dpbmcgdGhlCiAgZ3Vu
eWFoIGFuZCBNZWRpYXRlayBHZW5pbyBiaW5kaW5ncyAoS3J6eXN6dG9mIEtvemxvd3NraSkuCi0g
QWRkIEpvc8OpJ3MgYW5kIERhdmlkJ3MgQ28tZGV2ZWxvcGVkLWJ5L1NpZ25lZC1vZmYtYnkuCgog
Li4uL2JpbmRpbmdzL2Jhby9iYW8saW8tZGlzcGF0Y2hlci55YW1sICAgICAgIHwgNTggKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2Jhbyxpby1k
aXNwYXRjaGVyLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5mMTE4YzZkNDg2YTYKLS0tIC9kZXYvbnVsbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlh
bWwKQEAgLTAsMCArMSw1OCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlhbWwjCiskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IEJhbyBI
eXBlcnZpc29yIEkvTyBEaXNwYXRjaGVyIERldmljZQorCittYWludGFpbmVyczoKKyAgLSBKb8Oj
byBQZWl4b3RvIDxqcGVpeG90b0Bvc3l4LnRlY2g+CisgIC0gSm9zw6kgTWFydGlucyA8am9zZUBv
c3l4LnRlY2g+CisgIC0gRGF2aWQgQ2VyZGVpcmEgPGRhdmlkbWNlcmRlaXJhQG9zeXgudGVjaD4K
KworZGVzY3JpcHRpb246CisgIEJhY2tlbmQgZGV2aWNlIGV4cG9zZWQgYnkgdGhlIEJhbyBoeXBl
cnZpc29yIHRvIGEgZ3Vlc3QgdGhhdCBzZXJ2aWNlcworICBwYXJhdmlydHVhbGlzZWQgKFZpcnRJ
TykgSS9PIG9uIGJlaGFsZiBvZiBhIGZyb250ZW5kIGd1ZXN0LiBFYWNoIGRldmljZQorICBvd25z
IG9uZSBjb250aWd1b3VzIHNoYXJlZC1tZW1vcnkgcmVnaW9uIHVzZWQgdG8gZXhjaGFuZ2UgSS9P
IGJ1ZmZlcnMKKyAgd2l0aCBpdHMgZnJvbnRlbmQsIGFuZCBvbmUgaW50ZXJydXB0IHRoZSBoeXBl
cnZpc29yIHJhaXNlcyB0byBzaWduYWwgYQorICBwZW5kaW5nIEkvTyByZXF1ZXN0LiBBIGJhY2tl
bmQgZ3Vlc3QgdGhhdCBzZXJ2aWNlcyBzZXZlcmFsIGZyb250ZW5kcworICBpbnN0YW50aWF0ZXMg
b25lIG5vZGUgcGVyIGJhY2tlbmQgZGV2aWNlLgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxl
OgorICAgIGNvbnN0OiBiYW8saW8tZGlzcGF0Y2hlcgorCisgIHJlZzoKKyAgICBtYXhJdGVtczog
MQorICAgIGRlc2NyaXB0aW9uOgorICAgICAgU2hhcmVkLW1lbW9yeSByZWdpb24gdXNlZCB0byBl
eGNoYW5nZSBJL08gYnVmZmVycyB3aXRoIHRoZSBmcm9udGVuZC4KKworICBpbnRlcnJ1cHRzOgor
ICAgIG1heEl0ZW1zOiAxCisgICAgZGVzY3JpcHRpb246CisgICAgICBJbnRlcnJ1cHQgcmFpc2Vk
IGJ5IHRoZSBoeXBlcnZpc29yIHRvIHNpZ25hbCBhIHBlbmRpbmcgSS9PIHJlcXVlc3QuCisKKyAg
YmFvLGlkOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
MgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgSHlwZXJ2aXNvci1hc3NpZ25lZCBpZGVudGlmaWVy
IG9mIHRoZSBiYWNrZW5kIGRldmljZSBtb2RlbC4gSXQgbXVzdAorICAgICAgbWF0Y2ggdGhlIGlk
ZW50aWZpZXIgY29uZmlndXJlZCBmb3IgdGhlIGRldmljZSBtb2RlbCBpbiB0aGUKKyAgICAgIGh5
cGVydmlzb3IuCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBpbnRl
cnJ1cHRzCisgIC0gYmFvLGlkCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFt
cGxlczoKKyAgLSB8CisgICAgc2htZW1ANTAwMDAwMDAgeworICAgICAgICBjb21wYXRpYmxlID0g
ImJhbyxpby1kaXNwYXRjaGVyIjsKKyAgICAgICAgcmVnID0gPDB4NTAwMDAwMDAgMHgwMTAwMDAw
MD47CisgICAgICAgIGludGVycnVwdHMgPSA8MHgwIDB4MDggMHgxPjsKKyAgICAgICAgYmFvLGlk
ID0gPDA+OworICAgIH07Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
