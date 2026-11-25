Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2065606A6A0
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iUxxl7JX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GxF8NsCT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TOvl3DxoZ8Hco4/tlAExP/j4hCYtf2cwoMjHnXYlO7s=; b=iUxxl7JXpmCHbmo9uwR5JTuxP4
	dsEoffqWUS2MWHENoJ4/DlR49cF7pYhrxQPwE5B1QlDg9gILmuHpW6Jc9Pza0U0RkATPVAgfyILg0
	y6w5QKsNCLrNU5HgdxvdxBrqy0Jq3X26h3DwQWeEXebnRJYwSaaBIwQAuLezOZ+g3Rnnfjz4WkuBD
	FsW1lbI9KeDsA0oi6eJnq2j4RNVuwEI2vjzwWpPyNsJ+zwA3UJR9EtZVTO/juhjhS7qhQZ8PgoYCz
	TiIUSrqp7f5l4MFIwIN+riF1vlAtpmdAGTKnlPkYzKEHOvIFa6EBV5kuzFKQ7JZgtHfL0lQWlGmlZ
	T1KQFyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSw-0000000BZPZ-2NfB;
	Wed, 25 Nov 2026 23:31:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMSn-0000000BZE4-3Asu
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:31:49 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso46656855e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649504; x=1796254304; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYw5GBAdPj90q6NncpK72EIMG1Zgi7jH/SYXlLevmww=;
        b=GxF8NsCTefZwgmk2Sd24F462EteWVUnZ8enLR1KAJ8/7cIK1WRsJU4PbC2jqWYdNcf
         wSWvDk5NANfwh1hM6gDwDDIUORuk6aL45gIQPXfqcuwL5cyC2qBEvimCsbHjx9sYJmKz
         hcPbSkGZbkuNOKsiwLA4BVGPx5RN+B+PYzcyudautPTROFrl6KoSZcAaJFqdXCleYycR
         NJ7pNpEvbEJiZObUDAt8gF250B/Dc5FWQWDRMRNvbgpY9rD1PCScfFyIRucH9PbU8n3a
         dfpiWdUPNVlnOwl6tTDhuz3rn55d5J0wrMQlaFMP88gOgeQzoYHcP6lvbRqO9uN9RZJq
         U1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649504; x=1796254304;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYw5GBAdPj90q6NncpK72EIMG1Zgi7jH/SYXlLevmww=;
        b=oKf+lk1Zl6uprUxjVx5PPY8HciiW+HgDGCRQ4E/6D8wNrcdRLkK+kVRtyYwPFYz3dL
         atwFc0T85flHK08gAf/7A3xODdB2165vuA36pxqIOZI+rQ9jGDmDixub/BacwVywQ8Sb
         h4iluc61d7app6bR8PgAHUibUDQbEIp8ErJbInn4bLjDAGi8K2QgwMg/mixo34/BK4q5
         VQ/MtLBFRexNUSf2U0ug/EAc1K7/i8rfyupRX0TYY8Ga+BWNLJqK439ZX6mz0uiHUzSa
         P0Bpx+eLkHXoCT9AEgxFhKLRBO25GPc7PuZT/pkOLA1e/2hZcvCWWBAGa/4rT20d4nqg
         0+rA==
X-Gm-Message-State: APuU4Z9hYpaOJMrHcLk2C97BqEekslIPFbS0GLTZyoTMDNYhU+JxsJOJ
	Bmm6S70qEsLiFZ9BNSQzzTvC/YGw6kHBxj4kUZahQ7ooG4cauUDyEXNyXr9XEBs2MFU=
X-Gm-Gg: AZFdTZfOe/sr6GTWNE30ste5cdS5RSJxj69tVS+UFVwMLH8ZozqtcBTUZyIm7evP9gi
	jXPqdsJju2BHsD7lyufWGwAXZqLD1XRk+OH3d+JNklekOFIE2N7BkyWtzecL1wdRfL/JcPJWbF5
	dZEEl9XM4e/TdxxneZk/A793ifet6E9VDGbuoEe8wTggsNLOaVp3QUu1IQ7fUrglRWurPkYKQ5E
	lOhdWd82uMsNKTT6f7MMyI8RGGdqj8fM205rCP5z0ndus6epdaP7qj7DFaqyXbKfvQtCaZDR90F
	JncPI61r0YaDCQ4E0r6IgH8plxx5yYLOT8TfKvm4mywNURkZrfYM9s3y8RcCWKGY8HHxKMyZAOQ
	GeJlmkyIi7Y1XIsK4TvDayLVuLZkNWuvLTH9Bp3/YUVTq7Wk/G5q+j2Cn4Rycg8dcitw4AcCvJq
	Hs/WkDxnhweL0Vll2yt+L4cN84LRYF+m4aX+5KXr05NKyP3wAtpJAIM2ki/ElrAd8GFP5bfM5+U
	Ab/3A4QIh9+D8DJej0FJpxlD+mVXFD9VaxvXQlU93Q3iBvBHQHvoRNpCcLVg1AtsO5jPdekzOcl
	JszjWnv04pzwDafWssG0694Y9of9CREP/HoniuhBgAwUfNv9+nir3ljYJaelJdRrKV+7vs0f/QD
	e6QtO2doH2w==
X-Received: by 2002:a05:600c:6749:b0:4bb:71c1:3ca6 with SMTP id 5b1f17b1804b1-4bb88819d15mr373167565e9.21.1795649503790;
        Wed, 25 Nov 2026 15:31:43 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm611586845e9.12.2026.11.25.15.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:43 -0800 (PST)
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
Subject: [PATCH RFC 13/19] serial: esp32: Add early console support for ESP32-P4
Date: Wed, 25 Nov 2026 23:30:14 +0000
Message-ID: <20261125233020.1380594-14-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153145_855777_F06D02F6 
X-CRM114-Status: GOOD (  17.83  )
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

UmVnaXN0ZXIgYW4gZWFybHkgY29uc29sZSBmb3IgdGhlIEVTUDMyLVA0IFVBUlQgdXNpbmcgdGhl
IFVBUlQKY29uZmlndXJhdGlvbiBsZWZ0IGJ5IGZpcm13YXJlLgoKRWFybHkgY29uc29sZSB3cml0
ZXMgY2FuIHJ1biBiZWZvcmUgdGltZXIgaW5pdGlhbGl6YXRpb24sIGFuZApub3JtYWwgY29uc29s
ZSB3cml0ZXMgY2FuIHJ1biB3aXRoIGxvY2FsIGludGVycnVwdHMgZGlzYWJsZWQuIFVzZQphIHNo
YXJlZCBwb2xsaW5nIHJvdXRpbmUgdGhhdCBib3VuZHMgdGhlIHdhaXQgZm9yIFRYIEZJRk8gc3Bh
Y2UgYnkKYSBmaXhlZCBudW1iZXIgb2YgcmVhZHMuCgpBbGxvdyAxMCwwMDAgcmVhZHMgcGVyIGNo
YXJhY3RlciBmb3IgdGhlIEVTUDMyLVA0IGVhcmx5IGNvbnNvbGUgYW5kCjEsMDAwLDAwMCBmb3Ig
dGhlIG90aGVyIGNhbGxlcnMuIERyb3AgdGhlIGNoYXJhY3RlciBpZiB0aGUgRklGTwpyZW1haW5z
IGZ1bGwgZm9yIHRoZSBlbnRpcmUgcG9sbGluZyBidWRnZXQuCgpWZXJpZmllZCBlYXJseSBib290
IG91dHB1dCBhbmQgYSB3b3JraW5nIFVBUlQgc2hlbGwgb24gdGhlIFdhdmVzaGFyZQpFU1AzMi1Q
NC1Nb2R1bGUtREVWLUtJVCB3aXRoIHRoZSBkcml2ZXIgYnVpbHQgaW50byBhbiBSVjMyIE5PTU1V
IGtlcm5lbC4KV2l0aCBhIHNpbXVsYXRlZCBGSUZPLCBib3RoIGxpbWl0cyBkcm9wcGVkIHRoZSBj
aGFyYWN0ZXIgd2hlbiB0aGUKRklGTyBzdGF5ZWQgZnVsbCBhbmQgd3JvdGUgaXQgd2hlbiBzcGFj
ZSBiZWNhbWUgYXZhaWxhYmxlIG9uIHRoZQpsYXN0IHJlYWQuCgpBSSBhc3Npc3RlZCB3aXRoIGlu
dGVncmF0aW5nIHRoZSBlYXJseSBjb25zb2xlIGFuZCBjaGVja2luZwppdHMgcmVnaXN0cmF0aW9u
IGluIHRoZSBsaW5rZWQga2VybmVsLgoKU2lnbmVkLW9mZi1ieTogVsOtdG9yIEh1Z28gU2lsdmEg
PHZpdG9yaGcyMDA4MEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy90dHkvc2VyaWFsL2VzcDMyX3Vh
cnQuYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFy
dC5jCmluZGV4IDAwMmQ2ZmRiZDg3NS4uNDUxY2FlYjQwNmZlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91
YXJ0LmMKQEAgLTI1LDYgKzI1LDcgQEAKIAogI2RlZmluZSBFU1AzMl9VQVJUX1RYX0ZJRk9fU0la
RQkxMjcKICNkZWZpbmUgRVNQMzJfVUFSVF9SWF9GSUZPX1NJWkUJMTI3CisjZGVmaW5lIEVTUDMy
X1VBUlRfVFhfUE9MTFMJCTEwMDAwMDAKIAogI2RlZmluZSBVQVJUX0ZJRk9fUkVHCQkJMHgwMAog
I2RlZmluZSBVQVJUX0lOVF9SQVdfUkVHCQkweDA0CkBAIC0xMDcsNiArMTA4LDcgQEAKICNkZWZp
bmUgRVNQMzJQNF9VQVJUX1NXX0RUUgkJCUJJVCgyMCkKICNkZWZpbmUgRVNQMzJQNF9VQVJUX1JU
U19JTlYJCQlCSVQoMTgpCiAjZGVmaW5lIEVTUDMyUDRfVUFSVF9EVFJfSU5WCQkJQklUKDE5KQor
I2RlZmluZSBFU1AzMlA0X0VBUkxZQ09OX1RYX1BPTExTCTEwMDAwCiAKIHN0cnVjdCBlc3AzMl9w
b3J0IHsKIAlzdHJ1Y3QgdWFydF9wb3J0IHBvcnQ7CkBAIC0zMzQsMTggKzMzNiwxOCBAQCBzdGF0
aWMgdm9pZCBlc3AzMl91YXJ0X3B1dF9jaGFyKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHU4IGMp
CiAJZXNwMzJfdWFydF93cml0ZShwb3J0LCBVQVJUX0ZJRk9fUkVHLCBjKTsKIH0KIAotc3RhdGlj
IHZvaWQgZXNwMzJfdWFydF9wdXRfY2hhcl9zeW5jKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHU4
IGMpCitzdGF0aWMgdm9pZCBlc3AzMl91YXJ0X3B1dF9jaGFyX3N5bmMoc3RydWN0IHVhcnRfcG9y
dCAqcG9ydCwgdTggYywKKwkJCQkgICAgIHVuc2lnbmVkIGludCBwb2xscykKIHsKLQl1bnNpZ25l
ZCBsb25nIHRpbWVvdXQgPSBqaWZmaWVzICsgSFo7Ci0KLQl3aGlsZSAoZXNwMzJfdWFydF90eF9m
aWZvX2NudChwb3J0KSA+PSBFU1AzMl9VQVJUX1RYX0ZJRk9fU0laRSkgewotCQlpZiAodGltZV9h
ZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkgewotCQkJZGV2X3dhcm4ocG9ydC0+ZGV2LCAidGltZW91
dCB3YWl0aW5nIGZvciBUWCBGSUZPXG4iKTsKKwkvKiBDb25zb2xlIHdyaXRlcyBjYW4gcnVuIGJl
Zm9yZSB0aW1lciBpbml0IG9yIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZC4gKi8KKwl3aGlsZSAo
cG9sbHMtLSkgeworCQlpZiAoZXNwMzJfdWFydF90eF9maWZvX2NudChwb3J0KSA8IEVTUDMyX1VB
UlRfVFhfRklGT19TSVpFKSB7CisJCQllc3AzMl91YXJ0X3B1dF9jaGFyKHBvcnQsIGMpOwogCQkJ
cmV0dXJuOwogCQl9CisKIAkJY3B1X3JlbGF4KCk7CiAJfQotCWVzcDMyX3VhcnRfcHV0X2NoYXIo
cG9ydCwgYyk7CiB9CiAKIHN0YXRpYyB2b2lkIGVzcDMyX3VhcnRfdHJhbnNtaXRfYnVmZmVyKHN0
cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCkBAIC02MDEsNyArNjAzLDcgQEAgc3RhdGljIGludCBlc3Az
Ml91YXJ0X3BvbGxfaW5pdChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQogCiBzdGF0aWMgdm9pZCBl
c3AzMl91YXJ0X3BvbGxfcHV0X2NoYXIoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgdW5zaWduZWQg
Y2hhciBjKQogewotCWVzcDMyX3VhcnRfcHV0X2NoYXJfc3luYyhwb3J0LCBjKTsKKwllc3AzMl91
YXJ0X3B1dF9jaGFyX3N5bmMocG9ydCwgYywgRVNQMzJfVUFSVF9UWF9QT0xMUyk7CiB9CiAKIHN0
YXRpYyBpbnQgZXNwMzJfdWFydF9wb2xsX2dldF9jaGFyKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQp
CkBAIC02MzUsNyArNjM3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1YXJ0X29wcyBlc3AzMl91
YXJ0X3BvcHMgPSB7CiAKIHN0YXRpYyB2b2lkIGVzcDMyX3VhcnRfY29uc29sZV9wdXRjaGFyKHN0
cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHU4IGMpCiB7Ci0JZXNwMzJfdWFydF9wdXRfY2hhcl9zeW5j
KHBvcnQsIGMpOworCWVzcDMyX3VhcnRfcHV0X2NoYXJfc3luYyhwb3J0LCBjLCBFU1AzMl9VQVJU
X1RYX1BPTExTKTsKIH0KIAogc3RhdGljIHZvaWQgZXNwMzJfdWFydF9zdHJpbmdfd3JpdGUoc3Ry
dWN0IHVhcnRfcG9ydCAqcG9ydCwgY29uc3QgY2hhciAqcywKQEAgLTcxOCw3ICs3MjAsNyBAQCBz
dGF0aWMgc3RydWN0IGNvbnNvbGUgZXNwMzJfdWFydF9jb25zb2xlID0gewogCiBzdGF0aWMgdm9p
ZCBlc3AzMl91YXJ0X2Vhcmx5Y29uX3B1dGNoYXIoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgdTgg
YykKIHsKLQllc3AzMl91YXJ0X3B1dF9jaGFyX3N5bmMocG9ydCwgYyk7CisJZXNwMzJfdWFydF9w
dXRfY2hhcl9zeW5jKHBvcnQsIGMsIEVTUDMyX1VBUlRfVFhfUE9MTFMpOwogfQogCiBzdGF0aWMg
dm9pZCBlc3AzMl91YXJ0X2Vhcmx5Y29uX3dyaXRlKHN0cnVjdCBjb25zb2xlICpjb24sIGNvbnN0
IGNoYXIgKnMsCkBAIC03ODQsNiArNzg2LDM0IEBAIHN0YXRpYyBpbnQgX19pbml0IGVzcDMyczNf
dWFydF9lYXJseV9jb25zb2xlX3NldHVwKHN0cnVjdCBlYXJseWNvbl9kZXZpY2UgKmRldmljCiBP
Rl9FQVJMWUNPTl9ERUNMQVJFKGVzcDMyczN1YXJ0LCAiZXNwLGVzcDMyczMtdWFydCIsCiAJCSAg
ICBlc3AzMnMzX3VhcnRfZWFybHlfY29uc29sZV9zZXR1cCk7CiAKK3N0YXRpYyB2b2lkIGVzcDMy
cDRfdWFydF9lYXJseWNvbl9wdXRjaGFyKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHU4IGMpCit7
CisJZXNwMzJfdWFydF9wdXRfY2hhcl9zeW5jKHBvcnQsIGMsIEVTUDMyUDRfRUFSTFlDT05fVFhf
UE9MTFMpOworfQorCitzdGF0aWMgdm9pZCBlc3AzMnA0X3VhcnRfZWFybHljb25fd3JpdGUoc3Ry
dWN0IGNvbnNvbGUgKmNvbiwgY29uc3QgY2hhciAqcywKKwkJCQkJdW5zaWduZWQgaW50IG4pCit7
CisJc3RydWN0IGVhcmx5Y29uX2RldmljZSAqZGV2ID0gY29uLT5kYXRhOworCisJdWFydF9jb25z
b2xlX3dyaXRlKCZkZXYtPnBvcnQsIHMsIG4sIGVzcDMycDRfdWFydF9lYXJseWNvbl9wdXRjaGFy
KTsKK30KKworc3RhdGljIGludCBfX2luaXQgZXNwMzJwNF91YXJ0X2Vhcmx5X2NvbnNvbGVfc2V0
dXAoc3RydWN0IGVhcmx5Y29uX2RldmljZSAqZGV2aWNlLAorCQkJCQkJICAgY29uc3QgY2hhciAq
b3B0aW9ucykKK3sKKwlpZiAoIWRldmljZS0+cG9ydC5tZW1iYXNlKQorCQlyZXR1cm4gLUVOT0RF
VjsKKworCS8qIFVzZSB0aGUgVUFSVCBjb25maWd1cmF0aW9uIGxlZnQgYnkgZmlybXdhcmUuICov
CisJZGV2aWNlLT5wb3J0LnByaXZhdGVfZGF0YSA9ICh2b2lkICopJmVzcDMycDRfdmFyaWFudDsK
KwlkZXZpY2UtPmNvbi0+d3JpdGUgPSBlc3AzMnA0X3VhcnRfZWFybHljb25fd3JpdGU7CisKKwly
ZXR1cm4gMDsKK30KK09GX0VBUkxZQ09OX0RFQ0xBUkUoZXNwMzJwNCwgImVzcCxlc3AzMnA0LXVh
cnQiLAorCQkgICAgZXNwMzJwNF91YXJ0X2Vhcmx5X2NvbnNvbGVfc2V0dXApOworCiBzdGF0aWMg
c3RydWN0IHVhcnRfZHJpdmVyIGVzcDMyX3VhcnRfcmVnID0gewogCS5vd25lcgkJPSBUSElTX01P
RFVMRSwKIAkuZHJpdmVyX25hbWUJPSBEUklWRVJfTkFNRSwKLS0gCjIuNTYuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
