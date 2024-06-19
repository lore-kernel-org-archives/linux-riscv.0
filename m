Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7834C2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKUTMdkQQLgdC/UdU4NF9iJxWTtqHwmgHkO28ArOUyM=; b=WXIpziLUvpvF42
	C9MlKZ89lDn9MuOLXodFhCbYti1+pn7jxQz/eguaNhAPM0t2LbKZbjLVuizPwnhVC04x9NCk/KU2X
	hEav3VxFDYwG9AGzCILA3kxhrmYOIKu9zY+WrnvB1aXEnkkf7n5rPZ4uzdIxhQ4xBaOTLCOY3Xjcz
	xzZwCGm0r0Jr+FvUDA3/bW2S14GhAw203b6+u6w6kMqPN4Ia+zvmCeM9klrXMatBez1vCMZBBVQSQ
	bOO0fbg9LgA5yyFUW70yvHYWJwgZh9cYjRpehRcOw+TSwr9p3pesMS0MM7vYFBVocInU85XijAHmU
	AAyBmx0DUJwUFruj5Kxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbJ-00000000zel-2lW5;
	Wed, 19 Jun 2024 11:35:41 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbF-00000000zbj-3mkj
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:40 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ec2ded8a79so5175171fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796936; x=1719401736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0PmMBKub5I32kw3OQ7yKpgs2VnUnUQFxbp3Wubvvb8=;
        b=g9lQv7Z61nv1xzIVZxC3trfsotnapOdrUWr8miX4eWLvYqcNSFIOW1Bz/gJSJORvnJ
         BPGQM9r88htIBPugid1llgfqG19T9KbvcCgwnEiXEbh6qYQZHUeO8pbGremOt0JmxINF
         hETfQpth1E5PyTYSL7ITTrwbWZ4X3cMMcRj4z6CSV4VZMu5qT/Xni4SUlenNMXMZuNot
         1u6t5u3sba3jLH0MCH+Zm+9qMl3quMzpjIswLsYqlNPOfjYFJnWH/vN7JdsWhWnwhbU9
         DzBDI+9j4GRomJ6bqNSd/29K6YZDetoAcwCErnAd5qm0N5JZfAUg6lJCaCGa2SAm0OMg
         dAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796936; x=1719401736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0PmMBKub5I32kw3OQ7yKpgs2VnUnUQFxbp3Wubvvb8=;
        b=NOvratpGPa9YxFJ85E/4NdQvmB79V5HCHsewPkFdsoRMlmjSdAwkYMNnAkxznk7xyt
         OCvIdi4pz5i8DzAOkeqbXtRMBU2GlVvZ+dgz9ZOXVIokrWNggSyChrme0BzeoaPrTCml
         4EPIPLpfAkja85x8viv7IQwzGkRXONXgyIuo5yJqwQ7aZBs+4c3hCeJKNCahUacZ/9gp
         2eh6fOo1e4Q9u4nESQFDEv+RTrNeyI+LnuelmTBH8ly1YoDHCt7wp3XBGLgrQTmcGlyB
         St5PG2GOF6JmJsxsg+qYUXoU+7Qxxv2msbKzT/RzIH1JXPc17vGxLxF0i6a6NbtEPXvh
         lWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRNtIohOk1YOiVvmYNMSOxEghV63Zf+katZKyDIYRV0Xx4nmLVALN0awK7f7uohgXrUrz4qdSAW0YvWTwfPFXUKe6N6koBMVAfSr3vKbO/
X-Gm-Message-State: AOJu0YybIW2fMo6+6yokoHITzRNjAV+IeUUMbvg8CWrxsiuM3MPzcbxN
	VSBPN6wPcihgjiNezDBZNR7w8mGzZIMDKx8VZY1JC+uaY4FtabhYSv5V/DyfCEo=
X-Google-Smtp-Source: AGHT+IFuiQe12ySMx1uVFaLMWupgr3h/vsw4XsgpQWD0r4gVFKJnVvYpOMaUKCr84w7Jsgw+DR3BMw==
X-Received: by 2002:a2e:a553:0:b0:2eb:e6fe:3092 with SMTP id 38308e7fff4ca-2ec3cfe8333mr18233921fa.4.1718796936025;
        Wed, 19 Jun 2024 04:35:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 01/16] dt-bindings: riscv: add Zimop ISA extension description
Date: Wed, 19 Jun 2024 13:35:11 +0200
Message-ID: <20240619113529.676940-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043537_972350_4AEB6396 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmltb3AgKE1heS1CZS1PcGVyYXRpb25zKSBJU0EgZXh0
ZW5zaW9uIHdoaWNoCndhcyByYXRpZmllZCBpbiBjb21taXQgNTgyMjA2MTRhNWYgb2YgdGhlIHJp
c2N2LWlzYS1tYW51YWwuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3Np
bmMuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwKaW5kZXggY2ZlZDgwYWQ1NTQwLi5lMjE0Njc5YWI2ZGEgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbApAQCAtMzYzLDYgKzM2MywxMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgcmF0aWZp
ZWQgaW4gdGhlIDIwMTkxMjEzIHZlcnNpb24gb2YgdGhlIHVucHJpdmlsZWdlZCBJU0EKICAgICAg
ICAgICAgIHNwZWNpZmljYXRpb24uCiAKKyAgICAgICAgLSBjb25zdDogemltb3AKKyAgICAgICAg
ICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaaW1vcCBleHRlbnNpb24g
dmVyc2lvbiAxLjAsIGFzIHJhdGlmaWVkIGluIGNvbW1pdAorICAgICAgICAgICAgNTgyMjA2MTRh
NWYgKCJaaW1vcCBpcyByYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KKwog
ICAgICAgICAtIGNvbnN0OiB6dHNvCiAgICAgICAgICAgZGVzY3JpcHRpb246CiAgICAgICAgICAg
ICBUaGUgc3RhbmRhcmQgWnRzbyBleHRlbnNpb24gZm9yIHRvdGFsIHN0b3JlIG9yZGVyaW5nLCBh
cyByYXRpZmllZAotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
