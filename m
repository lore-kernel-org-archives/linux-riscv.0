Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89776C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9vuzUfh5ut8DtxmfmQYy41YURP5w8gbieC7jiEP1nxo=; b=w45CIouk9Y3g5b
	mcwrnSF6aZL0k3B/87z+9C3Oh8oi+7Bfb4ISRy1W0mkHhyePOt08VeJYo096iNGdKny5fXquC45x8
	1qXklhnFVitMpI1oJj63pbdxXZm+vdoyWv1VHsErIvYcKMYxOFrRwhW9tlCHiHa4KzH/60C37zrvl
	Y6bR6WaTE2Y4GF+MoGKD0RuJJEPj5kkUK6zJorEyAlV9QaBM7hrlu+JaO5RQ9qGE+eBSNPaWVDZID
	F6SQACNo4ux2OhOhV2rQssb+vouv6M7oVGSgYknL70Pg170DyTE27yiIll1a64qfcQsfeWkDeoaHI
	2qXhOpX5xySpDM23ZMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg60F-00000001ALV-2LaQ;
	Fri, 01 Mar 2024 16:44:55 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg60C-00000001AKF-02q5
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 16:44:53 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d2c8c1b76cso4924701fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 08:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709311490; x=1709916290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fSMW0qhtBaxw1Ne7+Ji9afXRUSlXWtRAYNnO9M03wA=;
        b=iZRYC6rN3dB9S4uwS60e4iuoQegUqVSFSedfzC/FyEtvIjDklo9qBgNNj3PD9SOhXa
         /42YtpT3lq9GBYXZ5pw5z12ijCLi1sFHkADHDkFvwDD0/D8hmRQYthnn3ENZUwmZfFdu
         HfWYbQ2RPG1k+NDLvQjxGYh6+iRZj1RWCxRaeoVPXRT0OjbTUDocOsrzbwMrdsumZA9p
         VYOwGV34o1a9ZF97r9L1WAjyRhPCXSbHbghn/YqpeNsnfrDWBD7z5HVkea7ox30lDGpe
         4Iauv5BftGOCRW/saU8tZxsCEIoekFIQzbxD3BGsecZRtPbId505enV+I0iFArF4ytEK
         0C1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709311490; x=1709916290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fSMW0qhtBaxw1Ne7+Ji9afXRUSlXWtRAYNnO9M03wA=;
        b=Kia3vmMYfztORZh0nZabPof0mWnbrgXhO/zwJF+kPWhpZE+ZHRXgX2F4DXVJk1AoVW
         N8TsRiVVzzFDmvDXef206bq985sFRpXtennzHZXsgB+fuobSVYoCbZersmgL2s8ECXGV
         ViuJZ9SeOR8xShpUijHTLD6aeN9WociTztV5lD+uEo2nSwjBnkgGAR4u3gdkg8hbSjz1
         Vo1xTvDFnh2W4Xo9O5awazy4j99mWUyQy2FvvK54yGO5iKhXmVV6OXpMPsS/4tuPN6bR
         xh9kyO2DSDyU4mAHSNVo/9+D9Yb6IpHHAossiL57Ql2HaWD39XPS+NjoYq+f370tj6oU
         Rh+A==
X-Forwarded-Encrypted: i=1; AJvYcCWFwFRik3Cj9EJyiGPXM0ZS0g+ju2tq6MV/Gd1Ws1K3aqaqSNiJFyKNLhW8zA7aCtJcgRSqFuQSyKHx+rpTMvrF9gcGl3ibtMD3zMcV5xnJ
X-Gm-Message-State: AOJu0YxRNZLFNpmcvsTGf1v3AD/3vyUUhtYsJ7tuA9i3c6ygh04JrhrA
	eb/5CQaOK37p9OWFYp5/MCihTfDUTIRi37RNg9+nyvjeGmjbE0EWwNy3mdm0YdA=
X-Google-Smtp-Source: AGHT+IH+VZ/Ok1lQGCinD/i871+cRsq/HKRFrVNNHntki84EwJcMBwhp9FeP1K8gbRR0fmgRMfL0cA==
X-Received: by 2002:a05:6512:39c5:b0:513:258f:5ef3 with SMTP id k5-20020a05651239c500b00513258f5ef3mr2453949lfu.1.1709311489974;
        Fri, 01 Mar 2024 08:44:49 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:1cac:c075:fa3d:e5e9])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d5341000000b0033e11acf84asm4456462wrv.15.2024.03.01.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 08:44:49 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robin Ehn <rehn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Stefan O'Rear" <sorear@fastmail.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH] riscv: hwprobe: export highest virtual userspace address
Date: Fri,  1 Mar 2024 17:44:06 +0100
Message-ID: <20240301164407.475957-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_084452_210622_039EC346 
X-CRM114-Status: GOOD (  20.62  )
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

U29tZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIChPcGVuSkRLIGZvciBpbnN0YW5jZSkgdXNlcyB0
aGUgZnJlZSBNU0JzCmluIHBvaW50ZXJzIHRvIGluc2VydCBhZGRpdGlvbmFsIGluZm9ybWF0aW9u
IGZvciB0aGVpciBvd24gbG9naWMgYW5kCm5lZWQgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gZnJv
bSBzb21ld2hlcmUuIEN1cnJlbnRseSB0aGV5IHJlbHkgb24KcGFyc2luZyAvcHJvYy9jcHVpbmZv
ICJtbXU9c3Z4eCIgc3RyaW5nIHRvIG9idGFpbiB0aGUgY3VycmVudCB2YWx1ZSBvZgp2aXJ0dWFs
IGFkZHJlc3MgdXNhYmxlIGJpdHMgWzFdLiBTaW5jZSB0aGlzIHJlZmxlY3QgdGhlIHJhdyBzdXBw
b3J0ZWQKTU1VIG1vZGUsIGl0IG1pZ2h0IGRpZmZlciBmcm9tIHRoZSBsb2dpY2FsIG9uZSB1c2Vk
IGludGVybmFsbHkgd2hpY2ggaXMKd2h5IGFyY2hfZ2V0X21tYXBfZW5kKCkgaXMgdXNlZC4gRXhw
b3J0aW5nIHRoZSBoaWdoZXN0IG1tYXBhYmxlIGFkZHJlc3MKdGhyb3VnaCBod3Byb2JlIHdpbGwg
YWxsb3cgYSBtb3JlIHN0YWJsZSBpbnRlcmZhY2UgdG8gYmUgdXNlZC4gRm9yIHRoYXQKcHVycG9z
ZSwgYWRkIGEgbmV3IGh3cHJvYmUga2V5IG5hbWVkClJJU0NWX0hXUFJPQkVfS0VZX0hJR0hFU1Rf
VklSVF9BRERSRVNTIHdoaWNoIHdpbGwgZXhwb3J0IHRoZSBoaWdoZXN0CnVzZXJzcGFjZSB2aXJ0
dWFsIGFkZHJlc3MuCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9t
YXN0ZXIvc3JjL2hvdHNwb3Qvb3NfY3B1L2xpbnV4X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlz
Y3YuY3BwI0wxNzEgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KCi0tLQoKdjM6CiAtIE5vdGU6IEkgZGlkIG5vdCBhZGRlZCBTdGVmYW4gUmV2
aWV3ZWQtYnkgc2luY2UgSSBkaWQgbW9yZQogICBtb2RpZmljYXRpb25zIHRoYW4ganVzdCBhIHNp
bXBsZSByZXNwaW4uCiAtIEhhbmRsZSBDT05GSUdfTU1VPW4gYXMgd2VsbCBhbmQgcmVuYW1lIHRo
ZSBrZXkgdG8KICAgUklTQ1ZfSFdQUk9CRV9LRVlfSElHSEVTVF9WSVJUX0FERFJFU1MKIC0gQWRk
IGEgdXNlcl9tYXhfdmlydF9hZGRyKCkgbWFjcm8gdG8gaGFuZGxlICFNTVUgY29uZmlnCiAtIExp
bmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAyMjAxMTA5NTAuODcx
MzA3LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KCnYyOgogLSBOb3RlOiB0cmllZCBzeXNjb25mIHRv
IGV4cG9ydCBpdCBidXQgdGhpcyBpcyBub3QgYmFja2VkIGJ5IHN5c2NhbGwKICAgYW5kIHRodXMg
ZG9lcyBub3QgYWxsb3cgZXhwb3J0aW5nIHN1Y2ggaW5mb3JtYXRpb24gZWFzaWx5LgogLSBVc2Ug
YXJjaF9nZXRfbW1hcF9lbmQoKSBpbnN0ZWFkIG9mIFZBX0JJVFMgc2luY2UgaXQgcmVmbGVjdHMg
dGhlCiAgIG1heGltdW0gbG9naWNhbCBhZGRyZXNzIHVzZWQgYnkgdGhlIHJpc2N2IHBvcnQKIC0g
Q2hhbmdlIGh3cHJvYmUga2V5IG5hbWUgZnJvbSBSSVNDVl9IV1BST0JFX0tFWV9WQV9CSVRTIHRv
CiAgIFJJU0NWX0hXUFJPQkVfS0VZX01BWF9BRERSRVNTCiAtIExpbmsgdG8gdjE6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAyMDExNDAzMTkuMzYwMDg4LTEtY2xlZ2VyQHJpdm9z
aW5jLmNvbS8KLS0tCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMyAr
KysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oICAgICAgfCAyICstCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgIHwgOCArKysrKysrLQogYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYyAgICAgICB8IDQgKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9o
d3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCBi
MmJjYzllZWQ5YWEuLjg3NWQzMTIyYmQ2NiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2Jl
LnJzdApAQCAtMjEwLDMgKzIxMCw2IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoK
IAogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1
bnNpZ25lZCBpbnQgd2hpY2gKICAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96IGJs
b2NrIGluIGJ5dGVzLgorCisqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9ISUdIRVNUX1ZJ
UlRfQUREUkVTU2A6IEFuIHVuc2lnbmVkIGxvbmcgd2hpY2gKKyAgcmVwcmVzZW50IHRoZSBoaWdo
ZXN0IHVzZXJzcGFjZSB2aXJ0dWFsIGFkZHJlc3MgdXNhYmxlLgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJv
YmUuaAppbmRleCA2MzA1MDdkZmY1ZWEuLjE1MGE5ODc3YjBhZiAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d3Byb2JlLmgKQEAgLTgsNyArOCw3IEBACiAKICNpbmNsdWRlIDx1YXBpL2FzbS9od3Byb2JlLmg+
CiAKLSNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDYKKyNkZWZpbmUgUklTQ1ZfSFdQUk9C
RV9NQVhfS0VZIDcKIAogc3RhdGljIGlubGluZSBib29sIHJpc2N2X2h3cHJvYmVfa2V5X2lzX3Zh
bGlkKF9fczY0IGtleSkKIHsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJv
Y2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCmluZGV4IGE4NTA5
Y2MzMWFiMi4uMzQxODYzZDRkOTg5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Byb2Nlc3Nvci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKQEAg
LTE0LDcgKzE0LDcgQEAKIAogI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KIAotI2lmZGVmIENPTkZJ
R182NEJJVAorI2lmIGRlZmluZWQoQ09ORklHXzY0QklUKSAmJiBkZWZpbmVkKENPTkZJR19NTVUp
CiAjZGVmaW5lIERFRkFVTFRfTUFQX1dJTkRPVwkoVUwoMSkgPDwgKE1NQVBfVkFfQklUUyAtIDEp
KQogI2RlZmluZSBTVEFDS19UT1BfTUFYCQlUQVNLX1NJWkUKIApAQCAtNTgsNiArNTgsMTIgQEAK
IAogI2RlZmluZSBTVEFDS19UT1AJCURFRkFVTFRfTUFQX1dJTkRPVwogCisjaWZkZWYgQ09ORklH
X01NVQorI2RlZmluZSB1c2VyX21heF92aXJ0X2FkZHIoKSBhcmNoX2dldF9tbWFwX2VuZChVTE9O
R19NQVgsIDAsIDApCisjZWxzZQorI2RlZmluZQl1c2VyX21heF92aXJ0X2FkZHIoKSAwCisjZW5k
aWYgLyogQ09ORklHX01NVSAqLworCiAvKgogICogVGhpcyBkZWNpZGVzIHdoZXJlIHRoZSBrZXJu
ZWwgd2lsbCBzZWFyY2ggZm9yIGEgZnJlZSBjaHVuayBvZiB2bQogICogc3BhY2UgZHVyaW5nIG1t
YXAncy4KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDlmMmE4ZTNmZjIw
NC4uMzYzMGUzZjMwMzU0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
aHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAg
LTY3LDYgKzY3LDcgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9NSVNBTElHTkVEX1VOU1VQUE9SVEVECSg0IDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX01JU0FMSUdORURfTUFTSwkJKDcgPDwgMCkKICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlf
WklDQk9aX0JMT0NLX1NJWkUJNgorI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9ISUdIRVNUX1ZJ
UlRfQUREUkVTUwk3CiAvKiBJbmNyZWFzZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgd2hlbiBhZGRp
bmcgaXRlbXMuICovCiAKIC8qIEZsYWdzICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCBh
N2M1NmI0MWVmZDIuLjU2MGVhNDFhNzE2ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC04
LDYgKzgsNyBAQAogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+CiAjaW5jbHVkZSA8YXNtL2Nw
dWZlYXR1cmUuaD4KICNpbmNsdWRlIDxhc20vaHdwcm9iZS5oPgorI2luY2x1ZGUgPGFzbS9wcm9j
ZXNzb3IuaD4KICNpbmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5o
PgogI2luY2x1ZGUgPGFzbS91YWNjZXNzLmg+CkBAIC0yMDIsNiArMjAzLDkgQEAgc3RhdGljIHZv
aWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJaWYgKGh3
cHJvYmVfZXh0MF9oYXMoY3B1cywgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aKSkKIAkJCXBhaXIt
PnZhbHVlID0gcmlzY3ZfY2Jvel9ibG9ja19zaXplOwogCQlicmVhazsKKwljYXNlIFJJU0NWX0hX
UFJPQkVfS0VZX0hJR0hFU1RfVklSVF9BRERSRVNTOgorCQlwYWlyLT52YWx1ZSA9IHVzZXJfbWF4
X3ZpcnRfYWRkcigpOworCQlicmVhazsKIAogCS8qCiAJICogRm9yIGZvcndhcmQgY29tcGF0aWJp
bGl0eSwgdW5rbm93biBrZXlzIGRvbid0IGZhaWwgdGhlIHdob2xlCi0tIAoyLjQzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
