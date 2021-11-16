Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D495EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 11:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E95F63223
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 11:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E95F63223
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuMQXl4nrar0xhTi8Y7TpuUfXgGPUHApsgIRTcZGjs8=; b=yOyRkYtaCRgBIC
	O1/qibUYJF9Vw2ph44OA5gI00HBg6JPBcrv2Jn6s3c0HMbMQE6ZdMbW3MO1ySwemWF8r1LopoFiYd
	xuPbX9djva/vP9D+dOV0B5LGVTn3BEesjSa6NWz8tlWF4mH8V4nT6YvN3aeIh9Y3CQ6GpWF1ToY3t
	gC4Nwaw2TkeLq9CdM/FBp15gDoegsUu2PS189OvmZSTyACnVQLW6xGKfwqMJE4bqnQGy7G0X/Wa/W
	KZMEIs+nTFXyqLKB2b/CXMAJ4vqlEK+YjYjEcm3sg8xSCjs5gFXzESsO8eeDOscUVgd7KqHCR6LC+
	0ARrs8JpSKN7VysAQ2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwKC-001KuZ-Cf; Tue, 16 Nov 2021 11:08:28 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwJr-001Kpn-8d
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 11:08:09 +0000
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A24EF405F5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637060885;
 bh=0gQ2ZQRY7ofUxZzekozxLvLRb/wQIYBGFhN6RAAbDMs=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ExDuFgPwmmkCdGtV4vAIICKsFq0eACGgsuNZgPBO5Ny1SYeZbRhvwIB8r+WeS54XH
 vKr5KokjremA0aFwNf/I9SorNGw853ZIKufUc4PPf9Cwkoh1Vg8033lJFQiwjMnssO
 bOshzqyTbpOZxc81sug5XFhjGw8QAfI51BBhsohR7OMnbYFCA069oHkln369bTbz9E
 cfFq5Da0QOSCTRsBPnpyySho0tlWLUob9NqhmMAi3NlXBqcESOivRx03bKnf63rxGZ
 4jT26b0GmtbFk/HiL9lI2L4A1n4LgaVqeqxPNUiZWPbfiTqKobKrRWFniE0DkVtE37
 llJLyw2yZyjDw==
Received: by mail-lj1-f198.google.com with SMTP id
 b14-20020a05651c0b0e00b0021a1a39c481so2077962ljr.3
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 03:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0gQ2ZQRY7ofUxZzekozxLvLRb/wQIYBGFhN6RAAbDMs=;
 b=cnL8OKnrypmc3vvq5uLqOnqLghphhnFNELirjHv02QPDO2AuPyUb6nFKhMa5HvjOPi
 QX/L1RyayO/Jq1FdSUI9jykRyjFNy4T6Z94rEHmeFOllGg+tQkfpEVj2jj7czHZp7BBV
 R/h2ticvAXkwADKeplEP9CxOYrlqACddxu6XNtOdD8dSXRC47K4M2rWPOk+xuNkiBTma
 0IFVN+kM5yH44MV68RHXLKy0oZfAn+wV+F46r5qBYceNrW4oN9ALtqASQ7A1fKz95YMj
 xAe+9pHgdTnGaVbA52bJNid0zGUAy5yFW6Z0srij9tLaTwcwEmpKKHHT4m7LGCP1IVsN
 5dMA==
X-Gm-Message-State: AOAM530MG/J8jrOtN0LCNL3/qdyJ+sbQ2bxIYg9KqcgVyFTCeaB/FPPR
 uqoeggF6dQcfLwVg/6EnL10QkPEbWMwORlf2sVFOL92VWI3WgbwSjBLy7aRtfqc73h5KSB1fF7L
 L4MkiGhFnd90Ee/ezCjmebpfDK1101A9pB7iwPNpCCslimg==
X-Received: by 2002:a2e:5c87:: with SMTP id q129mr5996227ljb.424.1637060883666; 
 Tue, 16 Nov 2021 03:08:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydMp9fvLto/Bj6qzxU3CHtfkRwWGiNP0TmUHx9AxV+uxOKhgQLlIduUx8AneQrUoqPOC5FPQ==
X-Received: by 2002:a2e:5c87:: with SMTP id q129mr5996205ljb.424.1637060883488; 
 Tue, 16 Nov 2021 03:08:03 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 b13sm1619353lfv.200.2021.11.16.03.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:08:02 -0800 (PST)
Message-ID: <202f0fd8-1208-b17d-5ee5-e776e45cb065@canonical.com>
Date: Tue, 16 Nov 2021 12:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Expose the FU740 core
 supply regulator.
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Cc: Vincent Pelletier <plr.vincent@gmail.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
 <0879c5b0c72b9bf6bf71f880def166f8804f41c7.1637023980.git.plr.vincent@gmail.com>
 <2266648.AD6qrfpaa2@diego>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <2266648.AD6qrfpaa2@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_030807_476830_C8431A00 
X-CRM114-Status: GOOD (  24.72  )
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

T24gMTYvMTEvMjAyMSAxMDo1MywgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4gSGkgVmluY2VudCwK
PiAKPiBBbSBEaWVuc3RhZywgMTYuIE5vdmVtYmVyIDIwMjEsIDAxOjUyOjU5IENFVCBzY2hyaWVi
IFZpbmNlbnQgUGVsbGV0aWVyOgo+PiBQcm92aWRlcyBtb25pdG9yaW5nIG9mIGNvcmUgdm9sdGFn
ZSBhbmQgY3VycmVudDoKPj4gdHBzNTQ0YjIwLWkyYy0wLTFlCj4+IEFkYXB0ZXI6IGkyYy1vY29y
ZXMKPj4gdm91dDE6ICAgICAgIDkwNi4wMCBtVgo+PiB0ZW1wMTogICAgICAgIC00MC4wwrBDICAo
aGlnaCA9ICsxMjUuMMKwQywgY3JpdCA9ICsxNTAuMMKwQykKPj4gaW91dDE6ICAgICAgICAgNS4w
NiBBICAobWF4ID0gKzIwLjAwIEEsIGNyaXQgbWF4ID0gKzI2LjAwIEEpCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFZpbmNlbnQgUGVsbGV0aWVyIDxwbHIudmluY2VudEBnbWFpbC5jb20+Cj4+Cj4+IC0t
Cj4+IE5vdGUgZm9yIHJldmlldzogdGhpcyBwYXRjaCBoYXMgb25lIHdhcm5pbmcgZnJvbSBjaGVj
a3BhdGNoLnBsOgo+PiAgIFdBUk5JTkc6IERUIGNvbXBhdGlibGUgc3RyaW5nICJ0cHM1NDRiMjAi
IGFwcGVhcnMgdW4tZG9jdW1lbnRlZCAtLSBjaGVjayAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy8KPj4gICAjMzI6IEZJTEU6IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bm1hdGNoZWQtYTAwLmR0czo1NToKPj4gICArICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJ0cHM1NDRiMjAiOwo+PiBUaGlzIGNoaXAgaXMgaGFuZGxlZCBieSB0aGUgZXhpc3Rpbmcg
cG1idXMgbW9kdWxlLCBhbmQgdGhlcmUgaXMgaW5kZWVkIG5vCj4+IG1hdGNoaW5nIGVudHJ5IGlu
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9wbWJ1cy4gSSBhbSBub3QK
Pj4gZXNwZWNpYWxseSBrbm93bGVkZ2VhYmxlIGFib3V0IHRoaXMgY2hpcCwgSSBvbmx5IGtub3cg
aXQgaXMgdXNlZCBieSB0aGlzCj4+IGJvYXJkLCBzbyBJIGFtIG5vdCBzdXJlIEkgY2FuIGRvIHRo
ZSBiZXN0IGpvYiBpbiBwdXR0aW5nIHN1Y2ggYSBmaWxlCj4+IHRvZ2V0aGVyLgo+PiBJZiBuZWVk
ZWQgSSBjYW4gZ2l0IGl0IGEgdHJ5Lgo+IAo+IERldmljZXRyZWUgYmluZGluZ3MgYXJlIHN1cHBv
c2VkIHRvIGJlIHN0YWJsZSBpbnRvIHRoZSBmdXR1cmUsIHNvIGFuIGFjdHVhbGx5Cj4gcmV2aWV3
ZWQgYmluZGluZyBpcyBxdWl0ZSBuZWNlc3NhcnkgOy0pIC4KPiAKPiBJbiB0aGUgY2FzZSBvZiB5
b3VyIHRwczU0NGIyMCBpdCBzaG91bGQgYWxzbyBiZSBwcmV0dHkgZWFzeSB0byBkbywgYXMKPiAK
PiAJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3BtYnVzL3RpLHVjZDkw
MzIwLnlhbWwKPiAKPiBpcyBwcm9iYWJseSBhIHByZXR0eSBnb29kIG1hdGNoIHRvIHdoYXQgeW91
IG5lZWQgaW4gdGVybXMgb2YgWWFtbCBub3RhdGlvbi4KPiBKdXN0IG5lZWQgdG8gcmVwbGFjZSB0
aGUgbmFtaW5nIGluIHlvdXIgY29weSBhbmQgZHJvcCBpbiB0aGUgY29ycmVjdAo+IGRlc2NyaXB0
aW9uIGZyb20KPiAKPiAJaHR0cHM6Ly93d3cudGkuY29tL2xpdC9kcy9zeW1saW5rL3RwczU0NGIy
MC5wZGY/dHM9MTYzNzA1NTc4MDI3OAo+IAo+IGFuZCB5b3UgaGF2ZSBhIHdvcmtpbmcgYmluZGlu
Zy4KPiAKPiBUaGVuIGp1c3QgYWRkIGFub3RoZXIgcGF0Y2ggdG8geW91ciBzZXJpZXMgdGhhdCBt
aW1pY3MKPiAKPiAJaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9OGEzNmUzOGQ4YjBmYmI5MjYwOWU4Mzdh
NjdmOTE5MjAyZWM3ZWM1MQo+IAo+IGFuZCBpbmNsdWRlIHRoZSByZWxldmFudCBtYWludGFpbmVy
cyB0aGF0IHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgd2lsbAo+IGdpdmUgeW91LCBhbmQgeW91
J3JlIGFsbCBzZXQgOi0pCj4gCgpIaSBIZWlrbywKCkluIGN1cnJlbnQgZm9ybSB0aGUgYmluZGlu
Z3Mgd291bGQgYmUgY2xvc2UgdG8gdHJpdmlhbCBhbmQgd2UgYWN0dWFsbHkKZG8gbm90IGtub3cg
aG93IHByb3BlciBiaW5kaW5ncyB3b3VsZCBsb29rIGxpa2UgKHRoZSBkZXZpY2UgaXMgbm90CnRy
aXZpYWwpLiBUaGVyZWZvcmUgYmFzZWQgb24gUm9iJ3MgcmVjZW50IGNvbW1lbnRzIC0gYmV0dGVy
IHRvIGhhdmUKdHJpdmlhbCBzY2hlbWEgdGhhbiBub3RoaW5nIC0gSSBzZW50IGEgcGF0Y2ggYWRk
aW5nIHRoZW0gdG8gdHJpdmlhbC1kZXZpY2VzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtZGV2aWNldHJlZS8yMDIxMTExNjExMDIwNy42ODQ5NC0xLWtyenlzenRvZi5rb3psb3dza2lA
Y2Fub25pY2FsLmNvbS9ULyN1CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
