Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C40E7717F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mFPOZDJWsBpFOzekgjSWyWFKnVBRg+KKN/aSylAusZo=; b=Dkd7s+vtY9amfz
	1Fh2Cr46FDAO7HmSLvuMIgAgZLkJfj31Ts2NY2EJDKLLg/UZ6CCc03GZLmxQjGg8WCXTD7c5hpkfr
	rultO+hHcP6gA8+VIEIj8WaI6dJjfQjhZj5d/m8OoFycDu3yk1iXQlK/KAkk8pPbVjJOm/68pYXzo
	fSdIfT5v//nAVavXxZESMHq7JBeB5Cc0pOWkECJO6uDXEsYL2KO8vZJ/jVhRaNFkjEKA/izvysDPj
	+ivUpv5ggy7gLVc/6xiyQbIDEUZjTgg0NQd2FaRRxKNn7mhTjgNahYLg/8J2F8OTjjvui2NsbAMyo
	Ek0LT15JDeckAhMEenSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdDB-0000000H6Ad-16u0;
	Thu, 12 Dec 2024 07:02:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdD8-0000000H69q-0kva
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 07:02:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-72739105e02so341651b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 23:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733986929; x=1734591729; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGZhgzI92zZ53/39Sn1Oo9uqJ+TialabZU7b4n5pT6I=;
        b=yGBPdStbvoh1YF7PTFFiECVhCbdgjHJi6Unp5xsyOXMZvINgqZyUSxIAco+qyisvkz
         WsYNGXXzM7ZN/SE8QNHpcy3EjPxQjPTENtuKtG/mbLSYnLdRyrZWoXlpsHeEIqnBBJsO
         PJXqUEC4U+QCc5qT/NOXB0TdrIWM0uyyuEFB0eR/aSNYwKmWDUSNmWZTSU10ohkoDjl9
         YQWx8ft1Pqjiv7rILskfIxRLdRx8q5/UuCd4xmPfRrbItjo+Hp/tJ8DkyQsbsBUFa8dJ
         PpjakE/MsnQk2F0C1s7tJv+SHyaLBaNSn9N4F8j14s+QTRfc9atX9DulAUpYGrEt72Tw
         Djvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986929; x=1734591729;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGZhgzI92zZ53/39Sn1Oo9uqJ+TialabZU7b4n5pT6I=;
        b=dh+1tN8w9Lcu3M+Wx1DX26NpLTWC0nBPr/WPn6MOs3X5mPIJcNcO88qQjKrKvnIgkm
         RGgF5cLt/vWzzMqgeWsakTI3jst+CewY8fHOqtHFQHcWI86d4fGR2F3+1eZTNuIBqAwG
         lBXfNDQxYDbgcx0fY0LSDu4uQvLJD32x83Iigva7T+3YvOSp/Mwti39MD7KFa7a9IIFt
         zvkDKlTVFVaaOG99yQmTi9nB1uxhfmfPPW8xL/+c/ZZdrC8+V/B5Ffi/4uwe3zMNe3M+
         K+kNgTbgZPlHCnffQdr8Oi2ePFbPjNlx5YguceJYwkGl8o8MB96F8cdF0Gq9wxcfBDH0
         ss9A==
X-Forwarded-Encrypted: i=1; AJvYcCVBh9PL7a2QDtAiCmoijL53oJeCG3DShrLzE491dXzBkDgDNst6iykIv9oBLFhEVff9GRrr7/35lnaXZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaeOoZqhXF8gb5KaBBnQUUwJiuU0L6O8pfyJrMWeVRwhvbMzys
	YjIYWofw7jcSGQimBmh0wxD0eEO87ED/hhxwlTwmz4NBlQDuK1VT6+zxC3dvr+M=
X-Gm-Gg: ASbGncsLObGvcZ8xXyLqp5l4DL/Z7ktF83FG9jRNDPFnS3Z+CXI2nqEPaC/sRKVTFjw
	M2zL+cC826HtFJjtk53l87KqWwD/lHpVXu0Ngct1kfNc2A/rolqCTuxoyElgsT8UJu1HE77hdNe
	fKxnIBqe0VBBb1gEPrBxOQ2S0jl1qbhy8GdzROhbdkKBdfHJwwUFkgtg5A3e65U3Viu3xkHDJw4
	2L67YCzLE8NxHQjwRh2vD9CrdyfELlROqMkTAD+AD31Li2++0+wdzZMf5kH3AxaZCNBYtj2
X-Google-Smtp-Source: AGHT+IFVhoqBC+FHK0O0yj4L3ROsxkwQrItwr6XNYnjRPa8c45hGqnxiby8r0RoTiwqRnzYyUk6n5A==
X-Received: by 2002:a05:6a20:d8b:b0:1e0:cc4a:caab with SMTP id adf61e73a8af0-1e1ceae20demr2907188637.19.1733986928653;
        Wed, 11 Dec 2024 23:02:08 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd552c0a6asm5350471a12.63.2024.12.11.23.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:02:07 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Dec 2024 23:01:43 -0800
Subject: [PATCH v6] riscv: selftests: Fix warnings pointer masking test
MIME-Version: 1.0
Message-Id: <20241211-fix_warnings_pointer_masking_tests-v6-1-c7ae708fbd2f@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAFaKWmcC/5XQQWrDMBAF0KsErasiyRrJ7qr3KMHY8igZSqQgG
 TUl+O6VswrFi3j5P8z7MHeWMRFm9nG4s4SFMsVQg3k7MHcewgk5TTUzJZSWSmju6db/DClQOOX
 +GinMmPrLkL9r0c+Y58yb1gjUvgGtOlaha8J69Rj5OtZ8pjzH9PvYLHJtd/FFcslxkNgZAw7t8
 JmoxEzBvbt4YetCUftVVVU5euFAdOCh3VCbZxVeUpuqglPtKHxntJg2VL1f1VUVzlocrQLdmg0
 VnlXzkgrrXycwximvLP7/wLIsf6r477gvAgAA
X-Change-ID: 20241204-fix_warnings_pointer_masking_tests-3860e4f35429
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3794; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=oRAcg2/hExWeoK3VTcSjnjMHrzycrG0KO39nZHe9kSA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3pUV8Y5ae794gckLbey7U68dcarPu/979j780O1XLx+8
 t4SMrjbUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwESYhRgZXrxw/5qz8mrnrK4F
 mpvXnHG2yeJUfc03i7U4zno+21LOUob/WSePyZ79cthSSVBt+obtc+62r8i//qdzB9Oj600LZgY
 lMgIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230210_490671_FA84D8E8 
X-CRM114-Status: GOOD (  11.91  )
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

V2hlbiBjb21waWxpbmcgdGhlIHBvaW50ZXIgbWFza2luZyB0ZXN0cyB3aXRoIC1XYWxsIHRoaXMg
d2FybmluZwppcyBwcmVzZW50OgoKcG9pbnRlcl9tYXNraW5nLmM6IEluIGZ1bmN0aW9uIOKAmHRl
c3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bOKAmToKcG9pbnRlcl9tYXNraW5nLmM6MjAzOjk6IHdh
cm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkKZGVjbGFyZWQgd2l0
aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCiAg
MjAzIHwgICAgICAgICBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7IHwKICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5jOjIwODo5OiB3YXJuaW5nOgppZ25vcmlu
ZyByZXR1cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlCuKA
mHdhcm5fdW51c2VkX3Jlc3VsdOKAmSBbLVd1bnVzZWQtcmVzdWx0XQogIDIwOCB8ICAgICAgICAg
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwoKSSBjYW1lIGFjcm9zcyB0aGlzIG9uIHJpc2N2NjQt
bGludXgtZ251LWdjYyAoVWJ1bnR1CjExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCgpGaXggdGhpcyBi
eSBjaGVja2luZyB0aGF0IHRoZSBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbiBlcXVhbCB0aGUgZXhw
ZWN0ZWQKbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4uCgpGaXhlczogNzQ3MGI1YWZkMTUwICgicmlz
Y3Y6IHNlbGZ0ZXN0czogQWRkIGEgcG9pbnRlciBtYXNraW5nIHRlc3QiKQpTaWduZWQtb2ZmLWJ5
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjY6Ci0g
QWRkIGJhY2sga3NmdF90ZXN0X3Jlc3VsdCgpIChTYW11ZWwpCi0gTGluayB0byB2NTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNi1maXhfd2FybmluZ3NfcG9pbnRlcl9tYXNraW5n
X3Rlc3RzLXY1LTEtZWQ1NjZjMmYyN2U4QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NToKLSBO
byBsb25nZXIgc2tpcCBzZWNvbmQgcHdyaXRlIGlmIGZpcnN0IG9uZSBmYWlscwotIFVzZSB3cmFw
cGVyIGZ1bmN0aW9uIGluc3RlYWQgb2YgZ290byAoRHJldykKLSBMaW5rIHRvIHY0OiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjA1LWZpeF93YXJuaW5nc19wb2ludGVyX21hc2tpbmdf
dGVzdHMtdjQtMS0wYzc3ZWI3MjU0ODZAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY0OgotIFNr
aXAgc3lzY3RsX2VuYWJsZWQgdGVzdCBpZiBmaXJzdCBwd3JpdGUgZmFpbGVkCi0gTGluayB0byB2
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNS1maXhfd2FybmluZ3NfcG9pbnRl
cl9tYXNraW5nX3Rlc3RzLXYzLTEtNWMyOGIwZjk2NDBkQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBp
biB2MzoKLSBGaXggc3lzY3RsIGVuYWJsZWQgdGVzdCBjYXNlIChEcmV3L0FsZXgpCi0gTW92ZSBw
d3JpdGUgZXJyIGNvbmRpdGlvbiBpbnRvIGdvdG8gKERyZXcpCi0gTGluayB0byB2MjogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNC1maXhfd2FybmluZ3NfcG9pbnRlcl9tYXNraW5n
X3Rlc3RzLXYyLTEtMWJmMGM1MDk1ZjU4QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBJ
IGhhZCByZXQgIT0gMiBmb3IgdGVzdGluZywgSSBjaGFuZ2VkIGl0IHRvIGJlIHJldCAhPSAxLgot
IExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4X3dhcm5p
bmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12MS0xLWVhMWU5NjY1Y2U3YUByaXZvc2luYy5jb20K
LS0tCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jICB8
IDI4ICsrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwppbmRleCBkZWU0MWI3ZWUzZTMyMzE1MGQ1NTUyM2M4
YWNiZjNlYzM4ODU3Yjg3Li4wNTlkMmU4N2ViMWY3MzdjYWY0NGY2OTJiMjM5YmYzZTQ5YzIzM2I0
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9t
YXNraW5nLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJf
bWFza2luZy5jCkBAIC0xODUsOCArMTg1LDIwIEBAIHN0YXRpYyB2b2lkIHRlc3RfZm9ya19leGVj
KHZvaWQpCiAJfQogfQogCitzdGF0aWMgYm9vbCBwd3JpdGVfd3JhcHBlcihpbnQgZmQsIHZvaWQg
KmJ1Ziwgc2l6ZV90IGNvdW50LCBjb25zdCBjaGFyICptc2cpCit7CisJaW50IHJldCA9IHB3cml0
ZShmZCwgYnVmLCBjb3VudCwgMCk7CisKKwlpZiAocmV0ICE9IGNvdW50KSB7CisJCWtzZnRfcGVy
cm9yKG1zZyk7CisJCXJldHVybiBmYWxzZTsKKwl9CisJcmV0dXJuIHRydWU7Cit9CisKIHN0YXRp
YyB2b2lkIHRlc3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bCh2b2lkKQogeworCWNoYXIgKmVycl9w
d3JpdGVfbXNnID0gImZhaWxlZCB0byB3cml0ZSB0byAvcHJvYy9zeXMvYWJpL3RhZ2dlZF9hZGRy
X2Rpc2FibGVkXG4iOwogCWNoYXIgdmFsdWU7CiAJaW50IGZkOwogCkBAIC0yMDAsMTQgKzIxMiwx
OCBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKIAl9CiAK
IAl2YWx1ZSA9ICcxJzsKLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Ci0Ja3NmdF90ZXN0X3Jl
c3VsdChzZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IC1FSU5WQUwsCi0J
CQkgInN5c2N0bCBkaXNhYmxlZFxuIik7CisJaWYgKCFwd3JpdGVfd3JhcHBlcihmZCwgJnZhbHVl
LCAxLCAid3JpdGUgJzEnIikpCisJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbChlcnJfcHdyaXRlX21z
Zyk7CisJZWxzZQorCQlrc2Z0X3Rlc3RfcmVzdWx0KHNldF90YWdnZWRfYWRkcl9jdHJsKG1pbl9w
bWxlbiwgdHJ1ZSkgPT0gLUVJTlZBTCwKKwkJCQkgInN5c2N0bCBkaXNhYmxlZFxuIik7CiAKIAl2
YWx1ZSA9ICcwJzsKLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Ci0Ja3NmdF90ZXN0X3Jlc3Vs
dChzZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IDAsCi0JCQkgInN5c2N0
bCBlbmFibGVkXG4iKTsKKwlpZiAoIXB3cml0ZV93cmFwcGVyKGZkLCAmdmFsdWUsIDEsICJ3cml0
ZSAnMCciKSkKKwkJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKGVycl9wd3JpdGVfbXNnKTsKKwllbHNl
CisJCWtzZnRfdGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVl
KSA9PSAwLAorCQkJCSAic3lzY3RsIGVuYWJsZWRcbiIpOwogCiAJc2V0X3RhZ2dlZF9hZGRyX2N0
cmwoMCwgZmFsc2UpOwogCgotLS0KYmFzZS1jb21taXQ6IDQwMzg0Yzg0MGVhMTk0NGQ3YzVhMzky
ZTg5NzVlZDA4OGVjZjBiMzcKY2hhbmdlLWlkOiAyMDI0MTIwNC1maXhfd2FybmluZ3NfcG9pbnRl
cl9tYXNraW5nX3Rlc3RzLTM4NjBlNGYzNTQyOQotLSAKLSBDaGFybGllCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
