Return-Path: <SRS0=rZMy=QM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F90C282CB
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 12:42:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7251B2080F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  5 Feb 2019 12:42:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qNEZqeR0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hfg0rRmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7251B2080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DywfrDplph7oFTzx1yJrvu3hqsbZCj7Jhu+rI4UPklo=; b=qNEZqeR0hkZoQH
	2dojjiyK6YdokB3XG32CdxvjNIN8cdRdIjQnWprk3lIen3EIYmOxhCNI/tkOohKHGL5MewtI7fepG
	v2TVse+sL5xtvgOYemMB2ujVFSi+3CmPw2y/wCAlhOwZt8QyFafIhbtzzesNcD/OQab7Ry0iJcaOJ
	PKowyAJpbjzQT3mlxvs8Hyu51/n9PUVgj+rgYvdaADToPox/og0Xlzre9+d4906fu+35o3PHas2Ai
	hYL/cnZp6qleHqnOfq1rbRyH50X4s+UzPCc1a56RcW3hEsB13cfbuAbGkT+bnhdkYr9IH2y9Xutf5
	YAHvY3q/RV8S4uHnDNIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr03c-0003cy-TZ; Tue, 05 Feb 2019 12:42:32 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr035-0003CK-KL
 for linux-riscv@lists.infradead.org; Tue, 05 Feb 2019 12:42:24 +0000
Received: by mail-pg1-x544.google.com with SMTP id y4so1319502pgc.12
 for <linux-riscv@lists.infradead.org>; Tue, 05 Feb 2019 04:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iI6y08ByJ9IYoe8KpyT+hq3Vy79jkLyUMrmYFIWNeSQ=;
 b=Hfg0rRmL7nf9hm/Uu5ZsMjVbNCT/G72rrgg+d92gOvIFB9/d0mFnXYPu/COIwG9sfa
 tr8IecV8ztg/CLHUgoOGWV6NF+x982dQwGmgJjDWgCPMLlu9BkUbnFXA62dZ8caVR3G1
 zijeccw/aDz8hrhimYCtr1tGiyrE/bZ/gtOEgGFdg+XXSqkt5n8H75eeaRrVYRB/iHDs
 xZasmkcYagixt0/VurKHxhiSyjFRjuC2RD4EZ7Sv3R0Mf9xtnmxASwXQqtO95ZndqMND
 s3pkrpiTL15XXFpFkjW7gRW3MMy3/fMfB1jyLGLXw81EA2ykcwicKhRDCtMvpqFTrK4L
 VoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iI6y08ByJ9IYoe8KpyT+hq3Vy79jkLyUMrmYFIWNeSQ=;
 b=SBXAsFxcnvrmBQrD+fchXOBl5l6lEVBZoEebQaBWmQe0UVmDtHjJq4Je6ni3EJRq0S
 HuyTNlr2+azCYDlAHCAXWW5cPzBBwKXqNm1t74P/TXDOFemhLjOxb+uwKq/4SGku6i7v
 1bKNw1NPNrszWbWZnGYHIgRx99MNiNX8itI/GPsxG/gkSD+jHRTGZtNRn1aVkesUo3ug
 BuhHwCypQEAJwqxia00tu6kUbV+xShU3/YgI1PzkS+hswBG6HvSZ3JQJjG7/MJD1JKYr
 Vk9iaPb/oNqV5THo8hq5kYmHUyDwR9PIy9AjZEn85OQt9Pl02STnSXciKICrqIRKxdnJ
 S8iA==
X-Gm-Message-State: AHQUAubEnmSYr46bWcHRS2n54jByt24+s3jzU3ru3f/TYRDYvicTJ3XI
 MjTLvC9PeLsmFAN1QUvQCaZzjAoIyzMAgA==
X-Google-Smtp-Source: AHgI3IahRcgEqwgUaEzFighuDZ+KDbML+P/5o++d+GIxGiKewDg4Iwcfm2H+7+miMGmI+daj9Ll2cA==
X-Received: by 2002:a62:c28e:: with SMTP id w14mr4809385pfk.115.1549370518341; 
 Tue, 05 Feb 2019 04:41:58 -0800 (PST)
Received: from btopel-mobl.ger.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.139.73])
 by smtp.gmail.com with ESMTPSA id g6sm5116774pgq.18.2019.02.05.04.41.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Feb 2019 04:41:57 -0800 (PST)
From: bjorn.topel@gmail.com
To: linux-riscv@lists.infradead.org, daniel@iogearbox.net, ast@kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH bpf-next v2 0/4] Add RISC-V (RV64G) BPF JIT
Date: Tue,  5 Feb 2019 13:41:21 +0100
Message-Id: <20190205124125.5553-1-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_044200_404037_D140216B 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgoKSGkhCgpUaGlzIHYy
IHNlcmllcyBhZGRzIGFuIFJWNjRHIEJQRiBKSVQgdG8gdGhlIGtlcm5lbC4KCkF0IHRoZSBtb21l
bnQgdGhlIFJJU0MtViBMaW51eCBwb3J0IGRvZXMgbm90IHN1cHBvcnQKQ09ORklHX0hBVkVfS1BS
T0JFUyAoUGF0cmljayBTdMOkaGxpbiBzZW50IG91dCBhbiBSRkMgbGFzdCB5ZWFyKSwgd2hpY2gK
bWVhbnMgdGhhdCBDT05GSUdfQlBGX0VWRU5UUyBpcyBub3Qgc3VwcG9ydGVkLiBUaHVzLCBubyB0
ZXN0cwppbnZvbHZpbmcgQlBGX1BST0dfVFlQRV9UUkFDRVBPSU5ULCBCUEZfUFJPR19UWVBFX1BF
UkZfRVZFTlQsCkJQRl9QUk9HX1RZUEVfS1BST0JFIGFuZCBCUEZfUFJPR19UWVBFX1JBV19UUkFD
RVBPSU5UIHBhc3Nlcy4KClRoZSBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCBzdXBwb3J0ICJmYXIg
YnJhbmNoaW5nIiAoPjRLaUIpLgoKVGVzdCByZXN1bHRzOgogICMgbW9kcHJvYmUgdGVzdF9icGYK
ICB0ZXN0X2JwZjogU3VtbWFyeTogMzc4IFBBU1NFRCwgMCBGQUlMRUQsIFszNjYvMzY2IEpJVCdl
ZF0KCiAgIyBlY2hvIDEgPiAvcHJvYy9zeXMva2VybmVsL3VucHJpdmlsZWdlZF9icGZfZGlzYWJs
ZWQKICAjIC4vdGVzdF92ZXJpZmllcgogIC4uLgogIFN1bW1hcnk6IDc2MSBQQVNTRUQsIDUwNyBT
S0lQUEVELCAyIEZBSUxFRAoKTm90ZSB0aGF0ICJ0ZXN0X3ZlcmlmaWVyIiB3YXMgcnVuIHdpdGgg
b25lIGJ1aWxkIHdpdGgKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9eSBh
bmQgb25lIHdpdGhvdXQsIG90aGVyd2lzZQptYW55IG9mIHRoZSB0aGUgdGVzdHMgdGhhdCByZXF1
aXJlIHVuYWxpZ25lZCBhY2Nlc3Mgd2VyZSBza2lwcGVkLgoKQ09ORklHX0hBVkVfRUZGSUNJRU5U
X1VOQUxJR05FRF9BQ0NFU1M9eToKICAjIGVjaG8gMSA+IC9wcm9jL3N5cy9rZXJuZWwvdW5wcml2
aWxlZ2VkX2JwZl9kaXNhYmxlZAogICMgLi90ZXN0X3ZlcmlmaWVyIHwgZ3JlcCAtYyAnTk9URS4q
dW5rbm93biBhbGlnbicKICAwCgpObyBDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FD
Q0VTUzoKICAjIGVjaG8gMSA+IC9wcm9jL3N5cy9rZXJuZWwvdW5wcml2aWxlZ2VkX2JwZl9kaXNh
YmxlZAogICMgLi90ZXN0X3ZlcmlmaWVyIHwgZ3JlcCAtYyAnTk9URS4qdW5rbm93biBhbGlnbicK
ICA1OQoKVGhlIHR3byBmYWlsaW5nIHRlc3RfdmVyaWZpZXIgdGVzdHMgYXJlOgogICJsZF9hYnM6
IHZsYW4gKyBhYnMsIHRlc3QgMSIKICAibGRfYWJzOiBqdW1wIGFyb3VuZCBsZF9hYnMiCgpUaGlz
IGlzIGR1ZSB0byB0aGF0ICJmYXIgYnJhbmNoaW5nIiBpbnZvbHZlZCBpbiB0aG9zZSB0ZXN0cy4K
QWxsIHRlc3RzIHdoZXJlIGRvbmUgb24gUUVNVSBlbXVsYXRvciB2ZXJzaW9uIDMuMS41MAoodjMu
MS4wLTY4OC1nOGFlOTUxZmJjMTA2KS4gSSdsbCB0ZXN0IGl0IG9uIHJlYWwgaGFyZHdhcmUsIHdo
ZW4gSSBnZXQKYWNjZXNzIHRvIGl0LgoKSSdtIHJvdXRpbmcgdGhpcyBwYXRjaCB2aWEgYnBmLW5l
eHQvbmV0ZGV2IG1haWxpbmcgbGlzdCAoYWZ0ZXIgYQpjb252ZXJzYXRpb24gd2l0aCBQYWxtZXIg
YXQgRk9TREVNKSwgbWFpbmx5IGJlY2F1c2UgdGhlIG90aGVyIEpJVHMKd2VudCB0aGF0IHBhdGgu
CgpBZ2FpbiwgdGhhbmtzIGZvciBhbGwgdGhlIGNvbW1lbnRzIQoKQ2hlZXJzLApCasO2cm4KCnYx
IC0+IHYyOgoqIEFkZGVkIEpNUDMyIHN1cHBvcnQuIChEYW5pZWwpCiogQWRkIFJJU0MtViB0byBE
b2N1bWVudGF0aW9uL3N5c2N0bC9uZXQudHh0LiAoRGFuaWVsKQoqIEZpeGVkIHNlZW5fY2FsbCgp
IGFzeW1tZXRyeS4gKERhbmllbCkKKiBGaXhlZCBicm9rZW4gYnBmX2ZsdXNoX2ljYWNoZSgpIHJh
bmdlLiAoRGFuaWVsKQoqIEFkZGVkIGFsaWdubWVudCBhbm5vdGF0aW9ucyB0byBzb21lIHNlbGZ0
ZXN0cy4KClJGQ3YxIC0+IHYxOgoqIENsZWFuZWQgdXAgdGhlIEtjb25maWcgYW5kIG5ldC9NYWtl
ZmlsZS4gKENocmlzdG9waCkKKiBSZW1vdmVkIHRoZSBlbnRyeS1zdHViIGFuZCBzcXVhc2hlZCB0
aGUgYnVpbGQvY29uZmlnIGNoYW5nZXMgdG8gYmUKICBwYXJ0IG9mIHRoZSBKSVQgaW1wbGVtZW50
YXRpb24uIChDaHJpc3RvcGgpCiogU2ltcGxpZmllZCB0aGUgcmVnaXN0ZXIgdHJhY2tpbmcgY29k
ZS4gKERhbmllbCkKKiBSZW1vdmVkIHVudXNlZCBtYWNyb3MuIChEYW5pZWwpCiogQWRkZWQgbXlz
ZWxmIGFzIG1haW50YWluZXIgYW5kIHVwZGF0ZWQgZG9jdW1lbnRhdGlvbi4gKERhbmllbCkKKiBS
ZW1vdmVkIEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MuIChDaHJpc3RvcGgsIFBhbG1l
cikKKiBBZGRlZCB0YWlsLWNhbGxzIGFuZCBjbGVhbmVkIHVwIHRoZSBjb2RlLgoKCkJqw7ZybiBU
w7ZwZWwgKDQpOgogIGJwZiwgcmlzY3Y6IGFkZCBCUEYgSklUIGZvciBSVjY0RwogIE1BSU5UQUlO
RVJTOiBhZGQgUklTQy1WIEJQRiBKSVQgbWFpbnRhaW5lcgogIGJwZiwgZG9jOiBhZGQgUklTQy1W
IEpJVCB0byBCUEYgZG9jdW1lbnRhdGlvbgogIHNlbGZ0ZXN0cy9icGY6IGFkZCAiYW55IGFsaWdu
bWVudCIgYW5ub3RhdGlvbiBmb3Igc29tZSB0ZXN0cwoKIERvY3VtZW50YXRpb24vbmV0d29ya2lu
Zy9maWx0ZXIudHh0ICAgICAgICAgICB8ICAgMTYgKy0KIERvY3VtZW50YXRpb24vc3lzY3RsL25l
dC50eHQgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgNiArCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKIGFyY2gvcmlzY3YvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KIGFyY2gvcmlzY3YvbmV0L01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
LmMgICAgICAgICAgICAgICAgIHwgMTYwMiArKysrKysrKysrKysrKysrKwogLi4uL3NlbGZ0ZXN0
cy9icGYvdmVyaWZpZXIvY3R4X3NrX21zZy5jICAgICAgIHwgICAgMSArCiAuLi4vdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL3ZlcmlmaWVyL2N0eF9za2IuYyAgfCAgICAxICsKIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JwZi92ZXJpZmllci9qbXAzMi5jICB8ICAgMjIgKwogdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL3ZlcmlmaWVyL2pzZXQuYyAgIHwgICAgMiArCiAuLi4vc2VsZnRlc3RzL2Jw
Zi92ZXJpZmllci9zcGlsbF9maWxsLmMgICAgICAgfCAgICAxICsKIC4uLi9zZWxmdGVzdHMvYnBm
L3ZlcmlmaWVyL3NwaW5fbG9jay5jICAgICAgICB8ICAgIDIgKwogLi4uL3NlbGZ0ZXN0cy9icGYv
dmVyaWZpZXIvdmFsdWVfcHRyX2FyaXRoLmMgIHwgICAgNCArCiAxNCBmaWxlcyBjaGFuZ2VkLCAx
NjU0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9uZXQvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvbXAuYwoKLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
