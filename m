Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE9FC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 16:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=v5d0aeri5qfiO/bj+aJfmHgREIpSdlj0RoBxW2kYi/I=; b=UcrD0AgRWryD1fATsrjs22KrE/
	bRaL+4CvYMu7zGgil9j3mgEUlZZzp/PFoVs9MxlnBUz7G3TWq2cVHVpF3M7dPOil8zUf8hZa+C9Ja
	1MxB0tMDPs+9P13yt2uF2TzhWAqpnEae8Wz6L6Is3T+kwHcpw8s9I52Uu/wb/GimH7TtHvESLCoHt
	QjNonETeg9znR9kPUUPoxY0xi4XIEHyDYbU4T+qFsXlpgI+x2FPwohOL5sZyawSWlhMejn1eecHky
	8aX4FlW6TUlsis/myWI2h4WLPEHZoCCqGB+h7nBtaWNDt6uyl3Yn3IZXt3gjjSBEuxRanoPFoSlsx
	7cnCRgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAulp-00AktL-1V;
	Wed, 06 Dec 2023 16:29:09 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAull-00Aks6-29
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 16:29:07 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6d83ff72dbbso484900a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701880142; x=1702484942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5ZbGGmoH/lFlZhMRZN1vjFtS/EFqjm5PsB2wakbCe8=;
        b=qedfUAxhSxVZpjUaJBMqGiBY8VU37W2/DEpgQakCJVSK6vG2iEGw/4d9C7FA3dmAgl
         MhHqQpTM3Un8trKcQcz10mr8Cwmaqs+aJLyC5urSGwtj4Vw/xnLHfJcxTE9sZpnMzbLY
         6GAtcbO/wKMB7LHTJ7VkTf5lcc0mHghq7NSre+fFi1v6FtRbXFJrP4V176eJksOLcpqd
         ECrQOAE0ZDhFcm5sstl5vf/kRbYNeNGbq4NP6e4hhl3sSbwWkSVdQsPt+OvVQxL5Tfkb
         /2DsVb/+9ls2vydLCjwY6E0bJxGi+LTZgk2vj1mJv2b5KWkYcl4hy7ppZ4vH41bqgEO3
         38mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701880142; x=1702484942;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5ZbGGmoH/lFlZhMRZN1vjFtS/EFqjm5PsB2wakbCe8=;
        b=Htui6XB1UUK6Q/hvtxP8zMVthdzsaTGpk5pt9M8iRJ0+wCz3lHWF0Zk3E19Z4YLGvI
         MrwKPmw36xL9pvpoaYOkCOI7ausrXYsB23srCjEkuDM63ID2WHihzkRao3tO84q0Zujy
         yRjZw8LoaXV9ZDvRD/cYZ/sSy+vaCfwpjVDwypHqw1DkJmV7SB9/xPKYtnda2XnQE7GL
         JR3QjV7NDw89jT/UuGKRC4mAxpQi7/pvh8XibsdIB2N/51/mTlK6x5j398Wnsxhye0zC
         cMcC0CvTXvxJ+nbHA1D5KX6kCTDzS/4zMNyfyP3I8K3f8QPJ0IQTcRRU8o/3BdKICxhN
         Y/9A==
X-Gm-Message-State: AOJu0YwhDIAfgqxyuBe/kCiCmextA1ado08aKM+jieDqe4QFtDvtrC/b
	W+jCkNb0BsA6vtsNxdtYD99J4Q==
X-Google-Smtp-Source: AGHT+IGn8NLklrz8gfLpf4ZROBA91oSNRaf0+Ba33U1gJX5IEC3OyhkihvKkTQRDR3ZHIRtV5+wHCg==
X-Received: by 2002:a9d:6385:0:b0:6d9:9ed9:f0e0 with SMTP id w5-20020a9d6385000000b006d99ed9f0e0mr559336otk.14.1701880141802;
        Wed, 06 Dec 2023 08:29:01 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id c25-20020a9d6859000000b006d9a0bf775asm24697oto.7.2023.12.06.08.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 08:29:01 -0800 (PST)
Date: Wed, 06 Dec 2023 08:29:01 -0800 (PST)
X-Google-Original-Date: Wed, 06 Dec 2023 08:28:59 PST (-0800)
Subject: Re: [PATCH v2] selftests: sud_test: return correct emulated syscall value on RISC-V
In-Reply-To: <20231206134438.473166-1-cleger@rivosinc.com>
CC: shuah@kernel.org, krisman@collabora.com, linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, cleger@rivosinc.com,
  Bjorn Topel <bjorn@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: cleger@rivosinc.com, tglx@linutronix.de
Message-ID: <mhng-bd5d2bdb-99ab-464a-a043-bdfc34b96b71@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_082905_912693_08EA4FA8 
X-CRM114-Status: GOOD (  23.14  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwNiBEZWMgMjAyMyAwNTo0NDozNyBQU1QgKC0wODAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPiBDdXJyZW50bHksIHRoZSBzdWRfdGVzdCBleHBlY3RzIHRoZSBlbXVsYXRl
ZCBzeXNjYWxsIHRvIHJldHVybiB0aGUKPiBlbXVsYXRlZCBzeXNjYWxsIG51bWJlci4gVGhpcyBh
c3N1bXB0aW9uIG9ubHkgd29ya3Mgb24gYXJjaGl0ZWN0dXJlcwo+IHdlcmUgdGhlIHN5c2NhbGwg
Y2FsbGluZyBjb252ZW50aW9uIHVzZSB0aGUgc2FtZSByZWdpc3RlciBmb3Igc3lzY2FsbAo+IG51
bWJlci9zeXNjYWxsIHJldHVybiB2YWx1ZS4gVGhpcyBpcyBub3QgdGhlIGNhc2UgZm9yIFJJU0Mt
ViBhbmQgdGh1cwo+IHRoZSByZXR1cm4gdmFsdWUgbXVzdCBiZSBhbHNvIGVtdWxhdGVkIHVzaW5n
IHRoZSBwcm92aWRlZCB1Y29udGV4dC4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBh
bG1lckByaXZvc2luYy5jb20+Cj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPgo+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIFYyOgo+ICAtIENoYW5nZXMgY29tbWVu
dCB0byBiZSBtb3JlIGV4cGxpY2l0Cj4gIC0gVXNlIEE3IHN5c2NhbGwgYXJnIHJhdGhlciB0aGFu
IGhhcmRjb2RpbmcgTUFHSUNfU1lTQ0FMTF8xCj4KPiAtLS0KPiAgLi4uL3NlbGZ0ZXN0cy9zeXNj
YWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYyAgICAgfCAxNCArKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKPiBpbmRl
eCBiNWQ1OTJkNDA5OWUuLmQ5NzVhNjc2NzMyOSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYwo+ICsrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jCj4gQEAg
LTE1OCw2ICsxNTgsMjAgQEAgc3RhdGljIHZvaWQgaGFuZGxlX3NpZ3N5cyhpbnQgc2lnLCBzaWdp
bmZvX3QgKmluZm8sIHZvaWQgKnVjb250ZXh0KQo+Cj4gIAkvKiBJbiBwcmVwYXJhdGlvbiBmb3Ig
c2lncmV0dXJuLiAqLwo+ICAJU1lTQ0FMTF9ESVNQQVRDSF9PRkYoZ2xvYl9zZWwpOwo+ICsKPiAr
CS8qCj4gKwkgKiBUaGUgdGVzdHMgZm9yIGFyZ3VtZW50IGhhbmRsaW5nIGFzc3VtZSB0aGF0IGBz
eXNjYWxsKHgpID09IHhgLiBUaGlzCj4gKwkgKiBpcyBhIE5PUCBvbiB4ODYgYmVjYXVzZSB0aGUg
c3lzY2FsbCBudW1iZXIgaXMgcGFzc2VkIGluICVyYXgsIHdoaWNoCj4gKwkgKiBoYXBwZW5zIHRv
IGFsc28gYmUgdGhlIGZ1bmN0aW9uIEFCSSByZXR1cm4gcmVnaXN0ZXIuICBPdGhlcgo+ICsJICog
YXJjaGl0ZWN0dXJlcyBtYXkgbmVlZCB0byBzd2l6emxlIHRoZSBhcmd1bWVudHMgYXJvdW5kLgo+
ICsJICovCj4gKyNpZiBkZWZpbmVkKF9fcmlzY3YpCj4gKy8qIFJFR19BNyBpcyBub3QgZGVmaW5l
ZCBpbiBsaWJjIGhlYWRlcnMgKi8KPiArIyBkZWZpbmUgUkVHX0E3IChSRUdfQTAgKyA3KQo+ICsK
PiArCSgodWNvbnRleHRfdCAqKXVjb250ZXh0KS0+dWNfbWNvbnRleHQuX19ncmVnc1tSRUdfQTBd
ID0KPiArCQkJKCh1Y29udGV4dF90ICopdWNvbnRleHQpLT51Y19tY29udGV4dC5fX2dyZWdzW1JF
R19BN107Cj4gKyNlbmRpZgo+ICB9Cj4KPiAgVEVTVChkaXNwYXRjaF9hbmRfcmV0dXJuKQoKVGhh
bmtzLgoKVGhvbWFzOiBsb29rcyBsaWtlIHlvdSBwaWNrZWQgdXAgYWxsIHRoZSBjb21taXRzIHRo
YXQgdG91Y2hlZCB0aGlzPyAgTm8gCnJ1c2ggb24gbXkgZW5kLCBqdXN0IExNSyBpZiB5b3Ugd2Fu
dCBtZSB0byBwaWNrIGl0IHVwIC0tIEknbSBnb2luZyB0byAKbGVhdmUgaXQgYWxvbmUgZm9yIG5v
dy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
