Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F00606A327
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q8Peuti+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B7wLoOzn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1w+/kgCk4GGJb5WcXvsn8AvzQNef7w8eRratZ4HltyQ=; b=q8Peuti+xkJkj0z0BtpRtjVxMc
	iJ/GWgjYQ52/ltkzraOHRngIp4+ETnc/79bZ4HhLcsvjIhpJ0NaT1FFgWiQ0YD9/cbzoj6UM3ABvP
	I1G2om0WJOMeidDMPY6ilWzDT8Z6mzKWtdJUWQivg4tigHRCuKmLO30k5LcgQvT014QnQ68JmUCtn
	KP+O77ru51L6xqyiAGZKh7B6vssPSxIep8OZ1hhgGIsR5KGXeAXdWU3G4JJ19z9rNSfTb/mCG2iRr
	4yM5XNSFOsKcFgwaCPEyfBXGLnW7Th9hw2DcVyTdWAcW2AZ3b7Q0BVlbkFCcN71jS0DExdJ/wK/V/
	cYF+7/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMTF-0000000BZku-2nby;
	Wed, 25 Nov 2026 23:32:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMT5-0000000BZXy-0GbT
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:32:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4aa5833c263so6111231f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649521; x=1796254321; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
        b=B7wLoOznh62BSM8/ZxRw8b8EfrcoCSN/yoNS15DTjuFWdag5xkgIs10vAMRwH4KJTC
         EGgKFawOjU+Syu2AjaAmKfbpFeFeEGFaBianqw9NhckL15ca2nNBc0j4KIJDmjqza0TV
         /grd5WkO7yhD3eQrPts2YmOorQtYfdM4zaI2/CoWidtqBLObLNW9YOCBMLtBX5cJeIC3
         xXOU58hjdl730D060BpCfzreWIidlCRZZJ73ZtnAHFWgD8w1BSo7ISpRSEYof+kajeZb
         zUjsmemmfOuqAC+axKsKXl8VGHqc2tpp1lYnfTenDP14aTEZk4qcZ68tzMlhS+AKNPPf
         CJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649521; x=1796254321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv33X/GQQiaxvlqfntYXWiFthGTmVov+9S67EUxnpPc=;
        b=gqefbD4BBG/Flc7PkWMfmRp4R1Z57ZXn/RxAmivyuo7jhY3IZST8/urFXMwueQcrko
         QHEH80Q2zuOzw+hoIb02d4b0gOonkTxbebACmnQ/3IeCGHKmn/X7G3AOVH2wgHN6qlH/
         MYuwVpi5zEhF8v5iPuw+ElqwGTIgkq4GydcibuNt+vCs7QOMa/z8ObA6KK8TUxYEGIVR
         TvlT8kYCds4jO5en5XFSwkhZfrTyyPeizm4cwonEinviY8quQkcYaY6MQuLgyUT1PoDg
         ENNQIqyEZv2zjaRpiIuPVBc1dOV/o2HGSOzwSDo9Q9TUmsHVEXodTDqPgWHf0/T1ZfKX
         AROA==
X-Gm-Message-State: APuU4Z/2GtNek87iez6o0+121Z1B89mu/IUZzSI9pFVcvnSc85lrDuB/
	043Cctjt4p7p2IixwL85K9h6FIDYwMTk0+jZDa3W8bfi+qngHzGLvRNsMChYmk8uCOk=
X-Gm-Gg: AZFdTZfJYw4vxH4+sotbVlLiM/WT9IF362pfFYhX/Z+1r+NW4s060V/Bg85ZeuuVEpf
	Ia7QpWyxSwPaF9EiVR3UZIVDKCJDs4MB9NJilGCpnQoEF01kdcxgtF5PPNREXgRMPWNGbgZO2E+
	MIbmva4cYMX5MGZm+rgxZ++MXGusXc8TSJjtsWrcOX3SZPWVSdMml6AQMG0O/99g5iOP4PGpMB2
	DDmgHyS2XkyVGvpnP7M+OYJnh+w5JgD+dmfDpqm3ZQ6QoF5Cax6/2476o0L45fOmwN5iRqkpmTy
	3X1l4rP2g9BhkGgB/Mvo5iOgkrAFgIWNZJ7KUsT1p1P5IP125Cu4jo+0UEmh9emIC20LLestON8
	K0ULhR3cMPbWOJIQmhi3nJk4F9OVX/xRO+M2XD+YyNvOOBI5eBQnQvnK3bK7IkI+0NdB9n4xrxp
	a8Xv6ne4e7uvPJrC+ZjFjl15qS1+1EuJL115++LaxBU8PiWVdvZHnWp+nPLUvNJQ+qyQeQdLnss
	aumg5yOoN4CH8I1c3pHt3SXq5EcQKxXDdQpPSN/0KITFiiXyV4eGE+OeeULlgGt3pz1EIuEY8r8
	j0lHWlQnRiVGU68F5FwWEEEru194yaXL7w+d3TIYraixLmUWzQa+zyACUv6WY6hBVqultMT5EMV
	yuSdKvJ6po5b35SyhANzFPXelhI8/Wx0=
X-Received: by 2002:a05:6000:184b:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-4abb42e9099mr37347042f8f.42.1795649520809;
        Wed, 25 Nov 2026 15:32:00 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm36903059f8f.5.2026.11.25.15.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:32:00 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 17/19] dt-bindings: riscv: cpus: Document Espressif ESP32-P4 HP harts
Date: Wed, 25 Nov 2026 23:30:18 +0000
Message-ID: <20261125233020.1380594-18-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153204_153958_9EB150D3 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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

QWRkIGVzcCxlc3AzMnA0LWhwIGFzIGEgY29tcGF0aWJsZSBmb3IgdGhlIEVTUDMyLVA0IGhpZ2gt
cGVyZm9ybWFuY2UKaGFydHMsIHdpdGggcmlzY3YgYXMgdGhlIGZhbGxiYWNrLgoKVGhlc2UgaGFy
dHMgcmVjZWl2ZSBpbnRlcnJ1cHRzIHRocm91Z2ggdGhlIG1lbW9yeS1tYXBwZWQgQ0xJQywgd2hp
Y2gKaGFzIGl0cyBvd24gYmluZGluZyBhbmQgbm9kZS4gRGlzYWxsb3cgdGhlIENTUi1iYXNlZCBp
bnRlcnJ1cHQKY29udHJvbGxlciBjaGlsZCBmb3IgRVNQMzItUDQgSFAgaGFydHMgYW5kIGtlZXAg
cmVxdWlyaW5nIGl0IGZvcgpvdGhlciBSSVNDLVYgQ1BVcy4KCkFJIGFzc2lzdGVkIHdpdGggd3Jp
dGluZyBhbmQgdmFsaWRhdGluZyB0aGUgc2NoZW1hIGNoYW5nZS4KCkxpbms6IGh0dHBzOi8vZG9j
dW1lbnRhdGlvbi5lc3ByZXNzaWYuY29tL2VzcDMyLXA0X3RlY2huaWNhbF9yZWZlcmVuY2VfbWFu
dWFsX2VuLnBkZgpTaWduZWQtb2ZmLWJ5OiBWw610b3IgSHVnbyBTaWx2YSA8dml0b3JoZzIwMDgw
QGdtYWlsLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwg
ICAgICAgICB8IDE3ICsrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAppbmRleCAwZGEyMTlhZTY3NjkuLjE3ZmVmNTJhZWRl
MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2Nw
dXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1
cy55YW1sCkBAIC0zOCw2ICszOCwxOSBAQCBhbGxPZjoKICAgICB0aGVuOgogICAgICAgcHJvcGVy
dGllczoKICAgICAgICAgdGhlYWQsdmxlbmI6IGZhbHNlCisgIC0gaWY6CisgICAgICBwcm9wZXJ0
aWVzOgorICAgICAgICBjb21wYXRpYmxlOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAg
ICAgY29uc3Q6IGVzcCxlc3AzMnA0LWhwCisgICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBjb21w
YXRpYmxlCisgICAgdGhlbjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIGludGVycnVwdC1j
b250cm9sbGVyOiBmYWxzZQorICAgIGVsc2U6CisgICAgICByZXF1aXJlZDoKKyAgICAgICAgLSBp
bnRlcnJ1cHQtY29udHJvbGxlcgogCiBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgpAQCAtNDgs
NiArNjEsNyBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgICAtIGFtZCxtYnY2NAogICAgICAg
ICAgICAgICAtIGFuZGVzdGVjaCxheDQ1bXAKICAgICAgICAgICAgICAgLSBjYW5hYW4sazIxMAor
ICAgICAgICAgICAgICAtIGVzcCxlc3AzMnA0LWhwCiAgICAgICAgICAgICAgIC0gbnVjbGVpLHV4
OTAwCiAgICAgICAgICAgICAgIC0gc2lmaXZlLGJ1bGxldDAKICAgICAgICAgICAgICAgLSBzaWZp
dmUsZTUKQEAgLTE1NCw5ICsxNjgsNiBAQCBkZXBlbmRlbmNpZXM6CiAgIHJpc2N2LGlzYS1iYXNl
OiBbInJpc2N2LGlzYS1leHRlbnNpb25zIl0KICAgcmlzY3YsaXNhLWV4dGVuc2lvbnM6IFsicmlz
Y3YsaXNhLWJhc2UiXQogCi1yZXF1aXJlZDoKLSAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcgotCiB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgotLSAKMi41Ni4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
