Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC7AC3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 12:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dzUddGvkQvPN6VNpMqGUYJ6JFwJJXzXzn0h8m+06tCI=; b=tHlHLVamw7iXHN
	KUy4FALe+rueliDpBhUctAtoYXPAevp9soP7Ky2/0ErexgV9cO8rATsRMfVRbNYN2mk4ALqmZhinC
	NqrTleZaCmcArtzQPAHCnVj8pIcgxQVhBE4+W6UxOYbokSMLlzU7GWNmx9uA/S/rodlLlUd3HaXez
	Eeffka8chG9cAinFqxTAE5XMiuTfxwlQl+DqLOs/bXUq3IQqNu7B6O3bpDQQ7eacP2iCP9Cdlpm7H
	clP9KzWY2z+vaFNVgMl1ZvUS30E3FApoZ8jcDdkLHAgR7wBfLg1JMIQ8FhI0QKsnLAXJOI0N0CCkl
	nOOSqkvhwnCfjGXtihRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRfO-00000003p3P-304g;
	Fri, 23 May 2025 12:38:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQhC-00000003inc-1W6V
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 11:36:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a36210dbe4so1013145f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748000172; x=1748604972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPjovNDjW6+EQ4LMpESmH+B/L0gygzy/uxelrXjYBg8=;
        b=PpDE3MZ9UXX1GkURBT5i5S6KwlOYCj3WB99cXcIgEE4MNREwFrIroU/l2ne/9YsEz3
         aKvsi/MXLoUpLWcw/4ezsfWHJ8p8k+PfA/PxlOTbtAA55dqqQc3pH1HSi3/h+7raaEbB
         0KkiCC6lk3mIx1hbd15TOY8JiSBQGB18Qvg3uccpsOpoJ0Nwmj8oxkBUh8+iJZRMzRCH
         fKWdrYLJ+mAdCSGnD8rZFtHMwCBlJGQNvrf3iOqeLmsyBdadjH6/1InzxVNy8HNYx/Rs
         aO/u+b0gfw1MiX+AZw4GxzIv4OC9lIZqhqz1DybcjJsGSHXnlQTVg4/6IxUA8mwgF1+J
         OmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748000172; x=1748604972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPjovNDjW6+EQ4LMpESmH+B/L0gygzy/uxelrXjYBg8=;
        b=cjkKqiY0nUrHLZfRxPspHc5ZamWz39rWQTFkRLAmezP9XysbBRDSPo4QhOA3EQsAC0
         TZmAbxdK70/SUz6tNm/d3iMaPjwS0RTeDoaoh2P3iZAf8zAJ+Rgc/+ON9yd7xmPgBPJa
         6S9MwtcTikH3uG4+AkTd4FnPM1ufPszOAuYY7b0LFCaNby2AGfgZ8SW4bdAoQtM1VqIR
         60UNnGKkpAD1FZKyQnfQF89o3g32PcFOPCdpeEqlMBZy6MFez+GhtrZpuZbNrU5uBun2
         rkDiM35cLCDyMFJtr+RIG9RkRBiIXcRQDdBuypRLCDLSsM9emNWD6qXRp0RkKWgdjJxg
         DtdA==
X-Forwarded-Encrypted: i=1; AJvYcCU2aYKSjFy6lg7x05qzswYh9SKylatVwRtw6qXBV4jh1krsDKn+F784DTR+Svzz72JwdnEZ5X5sdXu/TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoLxCQwjZsl0RFzNFAegwKtKzBxxzqL1cPad1Ll2eBngnzQGSQ
	M68KymdJZ0/YKasPAwmRZH+4Jyf+Zo73m7SRT2JQw2lZRC1/tUVzii8wEEJLr7VJefM=
X-Gm-Gg: ASbGnctmSkCvoIRkNQ0tJMNO89XWJv9dyKL+5VSZPM3H/weiIhUcv7Yk9HIBgELucmX
	zZInzBrV5dy1lcVEA56ID4Hpibd2NjCC9csRjDNAHMbtTos90jIlcH6RwpLiAwjFhyVf0XV/rmY
	R9CBdCqHL4Lrh/NOhDR85sqN/jw6xYrF2uIuPdiTjpOKGsj6+0YGNPJAOiWwXeUzl5b2SvlcRhy
	N5iYPdpghjvU079M/msaHf0VF23ipRpOq5DjhdyS7+20OV5xK7aRShMPHpy3wv87pwJCLq0YmvD
	ka2s3AkA+6Mel50Z2+2VoB6X5th8CLMpRrqyF1Rw9KY+43O0IRONlswE/bE=
X-Google-Smtp-Source: AGHT+IF2ZQShD6Bzg9HopdSxCvsBVk+Vm5DBLVCqW0pMilB6flZ85+PDQSUHNACKnOikFlZ7WJIovg==
X-Received: by 2002:a05:6000:188f:b0:3a3:71fb:7903 with SMTP id ffacd0b85a97d-3a371fb829emr6202649f8f.10.1748000171649;
        Fri, 23 May 2025 04:36:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3814262sm136898265e9.25.2025.05.23.04.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 04:36:11 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4] RISC-V: KVM: add KVM_CAP_RISCV_USERSPACE_SBI
Date: Fri, 23 May 2025 13:33:49 +0200
Message-ID: <20250523113347.2898042-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_043614_408949_27801300 
X-CRM114-Status: GOOD (  20.94  )
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

VGhlIG5ldyBjYXBhYmlsaXR5IGFsbG93cyB1c2Vyc3BhY2UgdG8gaW1wbGVtZW50IFNCSSBleHRl
bnNpb25zIHRoYXQgS1ZNCmRvZXMgbm90IGhhbmRsZS4gIFRoaXMgYWxsb3dzIHVzZXJzcGFjZSB0
byBpbXBsZW1lbnQgYW55IFNCSSBlY2FsbCBhcwp1c2Vyc3BhY2UgYWxyZWFkeSBoYXMgdGhlIGFi
aWxpdHkgdG8gZGlzYWJsZSBhY2NlbGVyYXRpb24gb2Ygc2VsZWN0ZWQKU0JJIGV4dGVuc2lvbnMu
ClRoZSBiYXNlIGV4dGVuc2lvbiBpcyBtYWRlIGNvbnRyb2xsYWJsZSBhcyB3ZWxsLCBidXQgb25s
eSB3aXRoIHRoZSBuZXcKY2FwYWJpbGl0eSwgYmVjYXVzZSBpdCB3YXMgcHJldmlvdXNseSBoYW5k
bGVkIHNwZWNpYWxseSBmb3Igc29tZSByZWFzb24uCioqKiBUaGUgcmVsYXRlZCBjb21wYXRpYmls
aXR5IFRPRE8gaW4gdGhlIGNvZGUgbmVlZHMgYWRkcmVzc2luZy4gKioqCgpUaGlzIGlzIGEgVk0g
Y2FwYWJpbGl0eSwgYmVjYXVzZSB1c2Vyc3BhY2Ugd2lsbCBtb3N0IGxpa2VseSB3YW50IHRvIGhh
dmUKdGhlIHNhbWUgYmVoYXZpb3IgZm9yIGFsbCBWQ1BVcy4gIFdlIGNhbiBlYXNpbHkgbWFrZSBp
dCBib3RoIGEgVkNQVSBhbmQKYSBWTSBjYXBhYmlsaXR5IGlmIHRoZXJlIGlzIGRlbWFuZCBpbiB0
aGUgZnV0dXJlLgoKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRh
bmFtaWNyby5jb20+Ci0tLQp2NDoKKiBmb3J3YXJkIGJhc2UgZXh0ZW5zaW9uIGFzIHdlbGwKKiBj
aGFuZ2UgdGhlIGlkIHRvIDI0MiwgYmVjYXVzZSAyNDEgaXMgYWxyZWFkeSB0YWtlbiBpbiBsaW51
eC1uZXh0CiogUUVNVSBleGFtcGxlOiBodHRwczovL2dpdGh1Yi5jb20vcmFkaW1rcmNtYXIvcWVt
dS90cmVlL21wX3N0YXRlX3Jlc2V0CnYzOiBuZXcKLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnQva3Zt
L2FwaS5yc3QgICAgfCAxMSArKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oIHwgIDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAgMSAr
CiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgfCAxNyArKysrKysrKysrKysrKy0t
LQogYXJjaC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgIHwgIDUgKysrKysKIGluY2x1ZGUv
dWFwaS9saW51eC9rdm0uaCAgICAgICAgICB8ICAxICsKIDYgZmlsZXMgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Zp
cnQva3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKaW5kZXggZTEw
NzY5NGZiNDFmLi5jOWQ2MjdkMTNhNWUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9r
dm0vYXBpLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKQEAgLTg1MDcs
NiArODUwNywxNyBAQCBnaXZlbiBWTS4KIFdoZW4gdGhpcyBjYXBhYmlsaXR5IGlzIGVuYWJsZWQs
IEtWTSByZXNldHMgdGhlIFZDUFUgd2hlbiBzZXR0aW5nCiBNUF9TVEFURV9JTklUX1JFQ0VJVkVE
IHRocm91Z2ggSU9DVEwuICBUaGUgb3JpZ2luYWwgTVBfU1RBVEUgaXMgcHJlc2VydmVkLgogCis3
LjQ0IEtWTV9DQVBfUklTQ1ZfVVNFUlNQQUNFX1NCSQorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHJpc2N2Cis6VHlwZTogVk0KKzpQYXJhbWV0ZXJz
OiBOb25lCis6UmV0dXJuczogMCBvbiBzdWNjZXNzLCAtRUlOVkFMIGlmIGFyZ1swXSBpcyBub3Qg
emVybworCitXaGVuIHRoaXMgY2FwYWJpbGl0eSBpcyBlbmFibGVkLCBLVk0gZm9yd2FyZHMgZWNh
bGxzIGZyb20gZGlzYWJsZWQgb3IgdW5rbm93bgorU0JJIGV4dGVuc2lvbnMgdG8gdXNlcnNwYWNl
LgorCiA4LiBPdGhlciBjYXBhYmlsaXRpZXMuCiA9PT09PT09PT09PT09PT09PT09PT09CiAKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCA4NWNmZWJjMzJlNGMuLjZmMTdjZDkyMzg4OSAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTIyLDYgKzEyMiw5IEBAIHN0cnVjdCBr
dm1fYXJjaCB7CiAKIAkvKiBLVk1fQ0FQX1JJU0NWX01QX1NUQVRFX1JFU0VUICovCiAJYm9vbCBt
cF9zdGF0ZV9yZXNldDsKKworCS8qIEtWTV9DQVBfUklTQ1ZfVVNFUlNQQUNFX1NCSSAqLworCWJv
b2wgdXNlcnNwYWNlX3NiaTsKIH07CiAKIHN0cnVjdCBrdm1fY3B1X3RyYXAgewpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2t2bS5oCmluZGV4IDVmNTlmZDIyNmNjNS4uZGQzYTVkYzUzZDM0IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2t2bS5oCkBAIC0yMDQsNiArMjA0LDcgQEAgZW51bSBLVk1fUklTQ1Zf
U0JJX0VYVF9JRCB7CiAJS1ZNX1JJU0NWX1NCSV9FWFRfREJDTiwKIAlLVk1fUklTQ1ZfU0JJX0VY
VF9TVEEsCiAJS1ZNX1JJU0NWX1NCSV9FWFRfU1VTUCwKKwlLVk1fUklTQ1ZfU0JJX0VYVF9CQVNF
LAogCUtWTV9SSVNDVl9TQklfRVhUX01BWCwKIH07CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCmluZGV4IDMxZmQzY2M5
OGQ2Ni4uNDk3ZDViMDIzMTUzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5j
CisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKQEAgLTM5LDcgKzM5LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSBzYmlfZXh0W10gPSB7
CiAJCS5leHRfcHRyID0gJnZjcHVfc2JpX2V4dF92MDEsCiAJfSwKIAl7Ci0JCS5leHRfaWR4ID0g
S1ZNX1JJU0NWX1NCSV9FWFRfTUFYLCAvKiBDYW4ndCBiZSBkaXNhYmxlZCAqLworCQkuZXh0X2lk
eCA9IEtWTV9SSVNDVl9TQklfRVhUX0JBU0UsCiAJCS5leHRfcHRyID0gJnZjcHVfc2JpX2V4dF9i
YXNlLAogCX0sCiAJewpAQCAtMjE3LDYgKzIxNywxMSBAQCBzdGF0aWMgaW50IHJpc2N2X3ZjcHVf
c2V0X3NiaV9leHRfc2luZ2xlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAlpZiAoIXNleHQgfHwg
c2NvbnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRf
U1RBVFVTX1VOQVZBSUxBQkxFKQogCQlyZXR1cm4gLUVOT0VOVDsKIAorCS8vIFRPRE86IHByb2Jh
Ymx5IHJlbW92ZSwgdGhlIGV4dGVuc2lvbiBvcmlnaW5hbGx5IGNvdWxkbid0IGJlCisJLy8gZGlz
YWJsZWQsIGJ1dCBpdCBkb2Vzbid0IHNlZW0gbmVjZXNzYXJ5CisJaWYgKCF2Y3B1LT5rdm0tPmFy
Y2gudXNlcnNwYWNlX3NiaSAmJiBzZXh0LT5leHRfaWQgPT0gS1ZNX1JJU0NWX1NCSV9FWFRfQkFT
RSkKKwkJcmV0dXJuIC1FTk9FTlQ7CisKIAlzY29udGV4dC0+ZXh0X3N0YXR1c1tzZXh0LT5leHRf
aWR4XSA9IChyZWdfdmFsKSA/CiAJCQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxFRCA6
CiAJCQlLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRElTQUJMRUQ7CkBAIC00NzEsOCArNDc2LDE0
IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBz
dHJ1Y3Qga3ZtX3J1biAqcnVuKQogI2VuZGlmCiAJCXJldCA9IHNiaV9leHQtPmhhbmRsZXIodmNw
dSwgcnVuLCAmc2JpX3JldCk7CiAJfSBlbHNlIHsKLQkJLyogUmV0dXJuIGVycm9yIGZvciB1bnN1
cHBvcnRlZCBTQkkgY2FsbHMgKi8KLQkJY3AtPmEwID0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwor
CQlpZiAodmNwdS0+a3ZtLT5hcmNoLnVzZXJzcGFjZV9zYmkpIHsKKwkJCW5leHRfc2VwYyA9IGZh
bHNlOworCQkJcmV0ID0gMDsKKwkJCWt2bV9yaXNjdl92Y3B1X3NiaV9mb3J3YXJkKHZjcHUsIHJ1
bik7CisJCX0gZWxzZSB7CisJCQkvKiBSZXR1cm4gZXJyb3IgZm9yIHVuc3VwcG9ydGVkIFNCSSBj
YWxscyAqLworCQkJY3AtPmEwID0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOworCQl9CiAJCWdvdG8g
ZWNhbGxfZG9uZTsKIAl9CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZtLmMgYi9hcmNo
L3Jpc2N2L2t2bS92bS5jCmluZGV4IGIyN2VjOGY5NjY5Ny4uMGI2Mzc4YjgzOTU1IDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2t2bS92bS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZtLmMKQEAgLTIx
Nyw2ICsyMTcsMTEgQEAgaW50IGt2bV92bV9pb2N0bF9lbmFibGVfY2FwKHN0cnVjdCBrdm0gKmt2
bSwgc3RydWN0IGt2bV9lbmFibGVfY2FwICpjYXApCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJa3Zt
LT5hcmNoLm1wX3N0YXRlX3Jlc2V0ID0gdHJ1ZTsKIAkJcmV0dXJuIDA7CisJY2FzZSBLVk1fQ0FQ
X1JJU0NWX1VTRVJTUEFDRV9TQkk6CisJCWlmIChjYXAtPmZsYWdzKQorCQkJcmV0dXJuIC1FSU5W
QUw7CisJCWt2bS0+YXJjaC51c2Vyc3BhY2Vfc2JpID0gdHJ1ZTsKKwkJcmV0dXJuIDA7CiAJZGVm
YXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xp
bnV4L2t2bS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bS5oCmluZGV4IDQ1NGI3ZDRhMDQ0OC4u
YmYyM2RlYjY2NzllIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKKysrIGIv
aW5jbHVkZS91YXBpL2xpbnV4L2t2bS5oCkBAIC05MzEsNiArOTMxLDcgQEAgc3RydWN0IGt2bV9l
bmFibGVfY2FwIHsKICNkZWZpbmUgS1ZNX0NBUF9YODZfR1VFU1RfTU9ERSAyMzgKICNkZWZpbmUg
S1ZNX0NBUF9BUk1fV1JJVEFCTEVfSU1QX0lEX1JFR1MgMjM5CiAjZGVmaW5lIEtWTV9DQVBfUklT
Q1ZfTVBfU1RBVEVfUkVTRVQgMjQwCisjZGVmaW5lIEtWTV9DQVBfUklTQ1ZfVVNFUlNQQUNFX1NC
SSAyNDIKIAogc3RydWN0IGt2bV9pcnFfcm91dGluZ19pcnFjaGlwIHsKIAlfX3UzMiBpcnFjaGlw
OwotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
