Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2A606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mDC4P6pl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zgofrt2z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yzmpom65bium6m2RFn3VaulZO14FTjt7KmI3EaRkjU0=; b=mDC4P6pl2kGYuR/UecdVYXAnAz
	phArX2gV0vxMSQJ/KZ+WQcSMFO9ZcQlUipWcAvVIoTZQgQ/c+3X8yc/UbhVtm78DbLgAt63WAC34s
	3OOEsHJnNH1W8QWmdj9n4h0aR4tOuXYHsu937ftrhWl8hy0eal2bGQWPdpTE3/wpAMAk+YrXm6PwM
	npcIxeoI5Ok5HwKNsNq8zMMmKAtUBY8pB3tgTQhdi5biABVrgoD/43qXDMSi9KqF4tmpc5X1TsD9D
	MU8hpXCgsCHQCXvrKwboyag6N03ehTxyUVfJqthcBoh1cKLAS0yR8i98QTb0zG1SnyU2QDj2eMqik
	tx53C8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSO-0000000BYoF-2Qgg;
	Wed, 25 Nov 2026 23:31:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSM-0000000BYlH-1kws
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so53919375e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649476; x=1796254276; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
        b=Zgofrt2zFD3Wy3WE0lTatTwOyIAFNx2ZMzG1/vI/Qlf0VqDgwHFBHd30Y7WKVPkHHg
         nM8hbKF0VfgdgsLGb8LuALFmneOyHMTuIi9DXyI83zEjYprc6osEfjsNIV97IwgBGi/e
         m/SiS98CnVBBzKIgeVg9Ook2TlPehsFNKhdw/3DWViV2V8MYVFeZ71HOESssdX6B4eYC
         sH8si75QuWmwTogEoGBd0iPsscXljM1VfU0CwkQUoBIttWaS92BWxVyCQ5ZE2ceL4fDX
         4GX/9B99Lzf+U4633Z+d4iGlu8I4Mg2zYf07QesqRTRTuicN1EWGXv4ZXQ5IPYoRR69+
         7Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649476; x=1796254276;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9We/x/kFtavsjCZuqwAHil7LDT45RYjQGWVveqfhXeM=;
        b=dk/qHmzSldxmUO5mhZ/UWcgh5u9l6QIWmlX9CVgN/r7b8PGTusHMd+wxH5L7SLUe6i
         0VJf+nJ7Rqkz+dVGszoAvZBgkth2kfZ56QvDy2TXO1l9c6dzlDWcddmrJDxQgK1tAxEy
         T+eG5+MqJheTFXfzU66knP4jW5cwzxpK7/mhsttkN3A4nqOzN30PjUH5VQUVqdsk/5mR
         szpDLrLggCw40fbKb6KwxH2aMuD/BiDHSY8T+f5P4IZzL3qwVe+qd9KQjxpVSh8sbJv3
         GslhhJvj7VIiA4eF7XYuZU+Mvrp9I/V817P0Ns6xjvcNfbb/cX5x87dBY4W6828UwNiD
         9Gkw==
X-Gm-Message-State: APuU4Z9rNqPmXXr3mrth5zQdcgLkfuvdUPydZCUuLlRZmlgpX7YHPZxd
	I7Y/bB9q8KvIbd8aIyWy1Xh1IQ80qMStf/5mGMrFz6QM78I4xZvw4X5sNQw9WGx6iaY=
X-Gm-Gg: AZFdTZdKnQSVN42k0R51YRBdXPvB95tFPy3gRj9bN1JQjI7x0mIvMKSk+QYYAqyvIhP
	OvpgIV+6BiEE74+bv9h9/1ZGYaLGuOOKuOQYnO7Edl604ycDacQnx6RhG5mbC/oLOan9InSrK5M
	RjpDvpJPbuY35PyvBsK2oIPJzzUR4BdZeIubAxY/GLMPOGZHRVPUjT7u1bkQ7gyPi0zrSSi6zxp
	NpkVLHXyRXxecDyLKBxAdwZCeO4rerNGWv0DeV/r7flfnu89WTNLKffIhlwUsFzST/Cv/sCOEGg
	GZlm6/FKFl7XI9n4U+V9Ym3OkpnKV74qwkPvx3oUNst4GROwxyZMADe2BZ7dc9WIqQSIqm52lTz
	TMyS3i1WQvy+TkhYihoKaQxlOFGyRwDby5ldUHzGXa1ZOPiyzX/Mdkz/ycJ4YeITs3Jrr/kyUPf
	VfJZJKXosYS+Re17Fkv4HCazZLJNzE0rghC3W021hirspDScSNNtqGOhRBHtmqmy96TsZ8Mbwax
	S4XSbJUerQ/GgCu/dg9/nJwI3zqKySsHQPgeAl4UP8N+cLDnWpkFnNucb3aMFoPccVQ0ndyHbTz
	txRnB7oUFJKFPDshIKseCuMVZKHf8nZvGT7t9jf+D67XY+GObv3BPCadWV1RiQ+iDx5NQ07fFaV
	vpWJStSL5uA==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr363197555e9.3.1795649476302;
        Wed, 25 Nov 2026 15:31:16 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm506528425e9.2.2026.11.25.15.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:16 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Subject: [PATCH RFC 09/19] dt-bindings: serial: Add Espressif ESP32-P4 UART
Date: Wed, 25 Nov 2026 23:30:10 +0000
Message-ID: <20261125233020.1380594-10-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153118_478465_53BA89C9 
X-CRM114-Status: GOOD (  10.85  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RG9jdW1lbnQgdGhlIEVTUDMyLVA0IFVBUlQgY29tcGF0aWJsZSB1c2luZyB0aGUgZXhpc3Rpbmcg
YmluZGluZwpwcm9wZXJ0aWVzIGZvciB0aGUgcmVnaXN0ZXIgcmFuZ2UsIGludGVycnVwdCBhbmQg
aW5wdXQgY2xvY2suCgpBSSBhc3Npc3RlZCB3aXRoIGRyYWZ0aW5nIHRoZSBiaW5kaW5nLgoKU2ln
bmVkLW9mZi1ieTogVsOtdG9yIEh1Z28gU2lsdmEgPHZpdG9yaGcyMDA4MEBnbWFpbC5jb20+Ci0t
LQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9lc3AsZXNwMzItdWFy
dC55YW1sIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9lc3AsZXNwMzItdWFydC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NlcmlhbC9lc3AsZXNwMzItdWFydC55YW1sCmluZGV4IDJhODBjYTk5N2EwYy4uYmYxNDFk
YjVlMmU1IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2Vy
aWFsL2VzcCxlc3AzMi11YXJ0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NlcmlhbC9lc3AsZXNwMzItdWFydC55YW1sCkBAIC0xMyw3ICsxMyw4IEBAIG1haW50
YWluZXJzOgogZGVzY3JpcHRpb246CiAgIEVTUDMyIFVBUlQgY29udHJvbGxlciBpcyBhIHBhcnQg
b2YgdGhlIEVTUDMyIFNvQy4KICAgRVNQMzJTMyBVQVJUIGNvbnRyb2xsZXIgaXMgYSBwYXJ0IG9m
IHRoZSBFU1AzMlMzIFNvQy4KLSAgQm90aCBTb0NzIGFyZSBwcm9kdWNlZCBieSBFc3ByZXNzaWYg
U3lzdGVtcyBDby4gTHRkLgorICBFU1AzMi1QNCBVQVJUIGNvbnRyb2xsZXIgaXMgYSBwYXJ0IG9m
IHRoZSBFU1AzMi1QNCBTb0MuCisgIFRoZXNlIFNvQ3MgYXJlIHByb2R1Y2VkIGJ5IEVzcHJlc3Np
ZiBTeXN0ZW1zIENvLiBMdGQuCiAKIGFsbE9mOgogICAtICRyZWY6IHNlcmlhbC55YW1sIwpAQCAt
MjIsNiArMjMsNyBAQCBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgogICAgIGVudW06CiAgICAg
ICAtIGVzcCxlc3AzMi11YXJ0CisgICAgICAtIGVzcCxlc3AzMnA0LXVhcnQKICAgICAgIC0gZXNw
LGVzcDMyczMtdWFydAogCiAgIHJlZzoKLS0gCjIuNTYuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
