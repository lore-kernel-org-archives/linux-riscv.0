Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70EFC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 19:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqfPIyrB0IawEHupX7Rn3c3rPddeB1giseHEWtOsQ68=; b=0//BfWjOPtFwbz
	lJc9xZ5GwKHCAYk8UVJOXWfq1fF+EGxbxPf4GMJF6pkWIkS+0BuyyCfaraBclMOtRACcqJW04A4XV
	kpS4UuULKOjNCk/zfxb24JV5VPcSqs3UfTgXMaYvI4TSfwz2g+HRj2QsVU+R+LAktLWK49xzK6hzk
	PoIPM1G+sB/zihkO/FmwVnAe6FdEC6CzgKYrMSIou6yZ/ThVK5p4+7hzjOvV719A9AJzGDjtbcYSC
	8iQWoskzT3YKlpK3qMbu8XAp64NEro9BhhMF/ukenxJ6zOTlY3W630YQ5wQSSbQKKqs1cbQ5jMBd2
	VCSa6JfoQ/ZyZ+q88wTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82Nw-0000000FDBg-3jRL;
	Thu, 24 Apr 2025 19:37:24 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Ss-0000000EucY-175q
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:23 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2264aefc45dso21630425ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516061; x=1746120861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eGkKF9qJdSzcJjZFaybinwNECXrhVepEnvdsnCoIkY=;
        b=KR478FTrmRaeRnjukKBmbQkgjYBV93WAfMSVo0OLc1ilwSO9ouVDMcTYsNJa+ZiY8W
         Ay4lZXcuZVsl8jimBo4a5X4YtAmxpQX9HB9U3NV/6LWMrj0Kn0VfBOGJhBBaD6zdkTd0
         UQegiFt/i00MxOzQ1vBwGzKnaGqiTKvBC69LXmDqF/SXjDrRhhLbyl3ov62m6YUnU+kg
         LrIsni6YGt3L5QmLCkEkxkUmS8l1EuQUD+myMwYOrIf2dsroCTSAwJl5eZhyOkbnCDjA
         STfEQXmJ2YifpNcs/8/NNfbpUHPHIhb+kU2ydKdzRDKQpENHb4H/yfbOF/GYL1ufpzOz
         AGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516061; x=1746120861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eGkKF9qJdSzcJjZFaybinwNECXrhVepEnvdsnCoIkY=;
        b=tJfTLHDHzWn+edL+7rB3U7wkDmWgKRjVsPYaZEat+hkqgz8WPdwh6W8otty8O1Fvj4
         R4TzQQu2EZYDlNU9ymvdojnVfKbn0fl1E9/4GJTmmLWrocemOaYAvLGbrpUBsheXP0rM
         i+hoDZ+IuH3efQH3TYxuDFdPax+BP4nD3iTaFSNPuoDVAQDe2e1u6+oaQBABT4MckuMM
         axg1ZreKiUneYI2Izqev6RIfjFnZBk28Xw9Z+9zxX4rQKBZcDLnzwcKJLz3210ffACLi
         Op85gIi8NxHdYGu+aPNzOU9Mp1UA8y0/Qmfy1BosOIJDMWMpFJ2jjbnN82/3v9GCjnlk
         8j8w==
X-Forwarded-Encrypted: i=1; AJvYcCWQFWI1MoBQyYbe1DSnrXj8gWO90RsPoO8RAssimNQchYWZ9KWuOXwBIYOLTMkXg+LIJ/spJLDS8KQ6LA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLy/ojZvV2PDDRZkulVaBne5t4BpnWlvQg4urNrJOxoKsypGCB
	EMyRmGxUTe/0M7I3ubDxNmIVMc4ve2L6B47VbznSntChyiW0/o55L8Dzp3qa1H0=
X-Gm-Gg: ASbGncu+j1PLIZE8F0p4D2+qUFD0rqXtUlfoT41b/ve9RFfZoCpFWO7VI9VyFUwoFSi
	qXi7pKTah9WIrCkKACwbeRMYPjHaMHrSrtW9L85OYZSnxHB+wmPcGizswwbPH7qX1/oI3D3T1Oc
	tWP9tq+XscvT3INBwMcG4XxIyho5fUMgOcJqodMdYHtc7auwH4hbXHuI/4Kibz+EoMLhhP9zKmh
	b34T4g2dytPgCtREq8ymXEpPsG+54c7Vu9VfhwCCDBlIylmCAbxPNdBdHfGt6Ul1p/DduHYwwyy
	QYoC1W2Mhwm1wGxLnbtPVuGk9fM3MoVyUhTLUtxjaA==
X-Google-Smtp-Source: AGHT+IEs4ew4uugiJtDbQhNEaEfxtdPEFF4bo2T+1eF9T2VcpqRrkFtRa0ffscLhiLfSNXEuYhJu4Q==
X-Received: by 2002:a17:902:db11:b0:223:5a6e:b16 with SMTP id d9443c01a7336-22dbd3f9de4mr5146115ad.5.1745516061340;
        Thu, 24 Apr 2025 10:34:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 24 Apr 2025 19:31:52 +0200
Message-ID: <20250424173204.1948385-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103422_301369_32C0D7D8 
X-CRM114-Status: GOOD (  13.64  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgfCAyMCArKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3NiaS5jCmluZGV4IGQ1N2U0ZGFlN2RhYy4uMDcwMDE0ZmYzNWQ0IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwpAQCAt
Mjk5LDYgKzI5OSw4IEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihpbnQgZmlkLCBjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBib29s
IHNiaV9md2Z0X3N1cHBvcnRlZDsKKwogLyoqCiAgKiBzYmlfZndmdF9zZXQoKSAtIFNldCBhIGZl
YXR1cmUgb24gdGhlIGxvY2FsIGhhcnQKICAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBi
ZSBzZXQKQEAgLTMwOSw3ICszMTEsMTUgQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGlu
dCBmaWQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKICAqLwogaW50IHNiaV9md2Z0
X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFn
cykKIHsKLQlyZXR1cm4gLUVPUE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAo
IXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2Jp
X2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVl
LCBmbGFncywgMCwgMCwgMCk7CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0
LmVycm9yKTsKIH0KIAogc3RydWN0IGZ3ZnRfc2V0X3JlcSB7CkBAIC0zNDgsNiArMzU4LDkgQEAg
aW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgdTMyIGZlYXR1
cmUsCiAJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAogCX07CiAKKwlpZiAoIXNiaV9md2Z0X3N1
cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJaWYgKGZlYXR1cmUgJiBTQklfRldG
VF9HTE9CQUxfRkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC02NzksNiArNjky
LDExIEBAIHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJCQlwcl9pbmZvKCJTQkkgREJDTiBl
eHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVnX2NvbnNvbGVfYXZhaWxhYmxlID0g
dHJ1ZTsKIAkJfQorCQlpZiAoc2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigzLCAw
KSAmJgorCQkgICAgc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXRlQpKSB7CisJCQlwcl9p
bmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOworCQkJc2JpX2Z3ZnRfc3VwcG9y
dGVkID0gdHJ1ZTsKKwkJfQogCX0gZWxzZSB7CiAJCV9fc2JpX3NldF90aW1lciA9IF9fc2JpX3Nl
dF90aW1lcl92MDE7CiAJCV9fc2JpX3NlbmRfaXBpCT0gX19zYmlfc2VuZF9pcGlfdjAxOwotLSAK
Mi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
