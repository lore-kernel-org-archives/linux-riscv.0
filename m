Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DC2C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFHZmSV8yoMOBl3D5NzdrXGlwxQumY4Ig4AoBPM4oRI=; b=EpDjYBkUFiG5GV
	zWSRTrCxOcLNGeUEpLYgOVnI9brUA3LEg6kQLjYuAg5NqD+Mn99LnCjpNtA2dbwkNnouDXnooUkzO
	0s815YFgB2IydybvRZnp5mO72/64L3rNtt9QsY+0ECpnRUwJ50HXwkemrZ7rghXwgLswiirWDYc0p
	f0BFwBKso2xt6zD3cWkW0GiPmdrD+oRmqYP4z/BrqbDEkH64jPJra/A3B2BxN9AqS+cPNFW+6Y+Nb
	TjH2/PFn4XBqp4ceSDq2KRnNlLE4r3W1BayxPSjid+eK4h8yXrkxknxNIlPWrjhiwZelvtA++++/A
	8UT03/OR5IH53ZDjdjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYY-00000002LFf-0kfq;
	Tue, 04 Jun 2024 12:46:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYV-00000002LCz-3MzB
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:46:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f63b8a28a3so824345ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505182; x=1718109982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkPyoR3KU3XSm/AEH/d1RonWJjnHK9mNu+9RmdnkI1w=;
        b=VYIPv+BnbZmN71fXPXEPngDz2cxg+LzE0iz9O9Qag0CbH9cxEdWB+gkwEytRVFgkFM
         FChe0cQpXCHjre/AyhAc2JBzfC3T+fSEwE6zJ7TMc7KODP2Nsky8FlLfIP7nr58u7/mL
         9DCp4Ix5MvrFWJqCj+gLl3eJ1SnKXJTzYJyTk3QDrsvD/7HBSpfhdjNU57PTgYMhPOi0
         entvuaM0t5GQVt6B25akG8SlJxb4V7t3Ia9FhVPiCGouii4WQP66yDmjCDMn6p5LxO2K
         FVjmvQoocP/mwO9YaPXG6wSdgZvG53CzHIxhfWv4+EwxWsLr2HBm9HKOWrUMBqoCZPoH
         CNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505182; x=1718109982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkPyoR3KU3XSm/AEH/d1RonWJjnHK9mNu+9RmdnkI1w=;
        b=sIb8gNgkaXIK6SGSO8WfQg/euUHtp70FXtb0+GwlMPxQ+nn6tVp6JhvQGAhZkH1uM1
         2pWO6kunLfJH8N+Pk2jlJp9wpb7FjMriYeS8l9A3CAJwUEu5FhpxYAiwqX5jvk6HTwM9
         nn8HcSwarnA5nvFV1uqi2Hh4FnZxN6wqAn4aHmFMssMnLVqorvJ3nJUAzjWDto7/14z0
         D09+9j2Pt4Iamd6QCvwvTdHdpMgtyf3Hlqp+p1xOiTozmpdW1MJIS3POKiEgpDzG6yuP
         nO83IfsESbD7EuqTAjC1V58o5iFBvclx/W3clUMcEAWwhJ/DC0PgQ+/m5LbTZ2kIk3r/
         xZMA==
X-Forwarded-Encrypted: i=1; AJvYcCXhdf3RBj5JR4gtwQbWU4tdcyj79z5JPJBd+GajgobyVA18J40glHvwEx6jgVA+eQuLnXM1m3fubaEIwN/oi/FzAy2ApKb0Et53UP/LfbmY
X-Gm-Message-State: AOJu0YxjUVTNYYVl+V9w6ULgxXjSSE2W0qp7RbiQGHxqR4gbvCnBCTM0
	m5+GBeHsKr5nT7AUZzoJ40vvL2Tr2qhjIA1Fxx7DmYQOnp3RYjjBep5LWX7RzFA=
X-Google-Smtp-Source: AGHT+IE7Gfwq22B4CqIBvkHs1xIPksWu/HDt59N3pxzuY9J8Ym84nB3KvA4Wk5h6TCyGNl1IpKdoHw==
X-Received: by 2002:a17:902:ecc6:b0:1f4:8a31:5a43 with SMTP id d9443c01a7336-1f6370b3a51mr135960905ad.4.1717505181811;
        Tue, 04 Jun 2024 05:46:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:46:21 -0700 (PDT)
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
Subject: [PATCH v6 01/16] dt-bindings: riscv: add Zimop ISA extension description
Date: Tue,  4 Jun 2024 14:45:33 +0200
Message-ID: <20240604124550.3214710-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054623_877873_27BCA17B 
X-CRM114-Status: UNSURE (   9.17  )
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
bnNpb25zLnlhbWwKaW5kZXggNDY4YzY0NjI0N2FhLi42MTYzNzAzMThhNjYgMTAwNjQ0Ci0tLSBh
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
cyByYXRpZmllZAotLSAKMi40NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
