Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F620D15DAA
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 15:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ8qHcLOJ2WDZf2L4weuHxrJZxXamIBhIPYJF/bW0uA=; b=4DK40TPD3vhcS9TzL2LRh9C58i
	RN4KOys43L68jp4JR+O1m0aE+S+weA0uRbpd/QjRJXLj5KcCvNx+EeoU4taVhWGKsCd0FjHX6Nk/u
	s+2FZhfgsbfnyZmdbgbzdRB2g4RYRz7UXNo4VH883qvQVwfswPGzElDFzN05vg+uU5JK5nUuMxOEj
	X997ZnrFtzq9BU4UQC6x8joydFwpzkz2VwNl6tTTPpqFvX1hqkuR+fSanoQSZ7dVzYQMcur0E2vPP
	Vu3avJiHu7Ol7e2TdhDKPvMd/zXuTq02YWHNTdQ+LRM2GUrDIppHTC9EG8/RrLdwrzy2mN64df9ED
	gWuR8kNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2u85-00000007ke5-272e;
	Mon, 21 Oct 2024 15:15:33 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2shY-00000007TBh-2X6n
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 13:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=r0U5qY1RbHzQQEwUflnA4yMD8feh9Y4PyDFIDo7ToMM=; b=IfhBOrGgeLwKsvWLkZ2rA7cM33
	NUnHuhnKjswRKgjXXZna3MSYRzqaAEzBkaHwoZmOCwSuEc5UbLSaX5iPn3SF+9w5Yafg9odI2pNmj
	Hc+68KEX8ZF5m8tMiFDSUJ3Ae0daWMdj8Yzv2ByyXp7ULhvmsj7KNjMKNdSSR5ZtbcMcxfm+uT0f/
	/SaHqzFHeo2culz1OiOz/QnJH+lHY1FNxoDjIMTA8SSmhoGIwX1nIc/RKfL2E98eC90+b0exlvUGY
	XxYoR5fY1MLG00NzjNG1YgOvDcCkifoEml1l9IOAZyHsFmcO9Y30g4XrEInpbTaHrqq3xUQL2Z2xg
	2b5M+W3A==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1t2shN-0009CS-0t; Mon, 21 Oct 2024 15:43:53 +0200
Received: from [178.197.248.43] (helo=[192.168.1.114])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1t2shL-0007GT-1B;
	Mon, 21 Oct 2024 15:43:51 +0200
Message-ID: <4ca8a746-263f-450d-af8d-64ba181a443f@iogearbox.net>
Date: Mon, 21 Oct 2024 15:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 4/5] selftests/bpf: Add benchmark for
 bpf_csum_diff() helper
To: Puranjay Mohan <puranjay@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Hao Luo <haoluo@google.com>, Helge Deller <deller@gmx.de>,
 Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 Martin KaFai Lau <martin.lau@linux.dev>, Mykola Lysenko <mykolal@fb.com>,
 netdev@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Puranjay Mohan <puranjay12@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Yonghong Song <yonghong.song@linux.dev>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-5-puranjay@kernel.org>
Content-Language: en-US
From: Daniel Borkmann <daniel@iogearbox.net>
Autocrypt: addr=daniel@iogearbox.net; keydata=
 xsFNBGNAkI0BEADiPFmKwpD3+vG5nsOznvJgrxUPJhFE46hARXWYbCxLxpbf2nehmtgnYpAN
 2HY+OJmdspBntWzGX8lnXF6eFUYLOoQpugoJHbehn9c0Dcictj8tc28MGMzxh4aK02H99KA8
 VaRBIDhmR7NJxLWAg9PgneTFzl2lRnycv8vSzj35L+W6XT7wDKoV4KtMr3Szu3g68OBbp1TV
 HbJH8qe2rl2QKOkysTFRXgpu/haWGs1BPpzKH/ua59+lVQt3ZupePpmzBEkevJK3iwR95TYF
 06Ltpw9ArW/g3KF0kFUQkGXYXe/icyzHrH1Yxqar/hsJhYImqoGRSKs1VLA5WkRI6KebfpJ+
 RK7Jxrt02AxZkivjAdIifFvarPPu0ydxxDAmgCq5mYJ5I/+BY0DdCAaZezKQvKw+RUEvXmbL
 94IfAwTFA1RAAuZw3Rz5SNVz7p4FzD54G4pWr3mUv7l6dV7W5DnnuohG1x6qCp+/3O619R26
 1a7Zh2HlrcNZfUmUUcpaRPP7sPkBBLhJfqjUzc2oHRNpK/1mQ/+mD9CjVFNz9OAGD0xFzNUo
 yOFu/N8EQfYD9lwntxM0dl+QPjYsH81H6zw6ofq+jVKcEMI/JAgFMU0EnxrtQKH7WXxhO4hx
 3DFM7Ui90hbExlFrXELyl/ahlll8gfrXY2cevtQsoJDvQLbv7QARAQABzSZEYW5pZWwgQm9y
 a21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0PsLBkQQTAQoAOxYhBCrUdtCTcZyapV2h+93z
 cY/jfzlXBQJjQJCNAhsDBQkHhM4ACAsJCAcNDAsKBRUKCQgLAh4BAheAAAoJEN3zcY/jfzlX
 dkUQAIFayRgjML1jnwKs7kvfbRxf11VI57EAG8a0IvxDlNKDcz74mH66HMyhMhPqCPBqphB5
 ZUjN4N5I7iMYB/oWUeohbuudH4+v6ebzzmgx/EO+jWksP3gBPmBeeaPv7xOvN/pPDSe/0Ywp
 dHpl3Np2dS6uVOMnyIsvmUGyclqWpJgPoVaXrVGgyuer5RpE/a3HJWlCBvFUnk19pwDMMZ8t
 0fk9O47HmGh9Ts3O8pGibfdREcPYeGGqRKRbaXvcRO1g5n5x8cmTm0sQYr2xhB01RJqWrgcj
 ve1TxcBG/eVMmBJefgCCkSs1suriihfjjLmJDCp9XI/FpXGiVoDS54TTQiKQinqtzP0jv+TH
 1Ku+6x7EjLoLH24ISGyHRmtXJrR/1Ou22t0qhCbtcT1gKmDbTj5TcqbnNMGWhRRTxgOCYvG0
 0P2U6+wNj3HFZ7DePRNQ08bM38t8MUpQw4Z2SkM+jdqrPC4f/5S8JzodCu4x80YHfcYSt+Jj
 ipu1Ve5/ftGlrSECvy80ZTKinwxj6lC3tei1bkI8RgWZClRnr06pirlvimJ4R0IghnvifGQb
 M1HwVbht8oyUEkOtUR0i0DMjk3M2NoZ0A3tTWAlAH8Y3y2H8yzRrKOsIuiyKye9pWZQbCDu4
 ZDKELR2+8LUh+ja1RVLMvtFxfh07w9Ha46LmRhpCzsFNBGNAkI0BEADJh65bNBGNPLM7cFVS
 nYG8tqT+hIxtR4Z8HQEGseAbqNDjCpKA8wsxQIp0dpaLyvrx4TAb/vWIlLCxNu8Wv4W1JOST
 wI+PIUCbO/UFxRy3hTNlb3zzmeKpd0detH49bP/Ag6F7iHTwQQRwEOECKKaOH52tiJeNvvyJ
 pPKSKRhmUuFKMhyRVK57ryUDgowlG/SPgxK9/Jto1SHS1VfQYKhzMn4pWFu0ILEQ5x8a0RoX
 k9p9XkwmXRYcENhC1P3nW4q1xHHlCkiqvrjmWSbSVFYRHHkbeUbh6GYuCuhqLe6SEJtqJW2l
 EVhf5AOp7eguba23h82M8PC4cYFl5moLAaNcPHsdBaQZznZ6NndTtmUENPiQc2EHjHrrZI5l
 kRx9hvDcV3Xnk7ie0eAZDmDEbMLvI13AvjqoabONZxra5YcPqxV2Biv0OYp+OiqavBwmk48Z
 P63kTxLddd7qSWbAArBoOd0wxZGZ6mV8Ci/ob8tV4rLSR/UOUi+9QnkxnJor14OfYkJKxot5
 hWdJ3MYXjmcHjImBWplOyRiB81JbVf567MQlanforHd1r0ITzMHYONmRghrQvzlaMQrs0V0H
 5/sIufaiDh7rLeZSimeVyoFvwvQPx5sXhjViaHa+zHZExP9jhS/WWfFE881fNK9qqV8pi+li
 2uov8g5yD6hh+EPH6wARAQABwsF8BBgBCgAmFiEEKtR20JNxnJqlXaH73fNxj+N/OVcFAmNA
 kI0CGwwFCQeEzgAACgkQ3fNxj+N/OVfFMhAA2zXBUzMLWgTm6iHKAPfz3xEmjtwCF2Qv/TT3
 KqNUfU3/0VN2HjMABNZR+q3apm+jq76y0iWroTun8Lxo7g89/VDPLSCT0Nb7+VSuVR/nXfk8
 R+OoXQgXFRimYMqtP+LmyYM5V0VsuSsJTSnLbJTyCJVu8lvk3T9B0BywVmSFddumv3/pLZGn
 17EoKEWg4lraXjPXnV/zaaLdV5c3Olmnj8vh+14HnU5Cnw/dLS8/e8DHozkhcEftOf+puCIl
 Awo8txxtLq3H7KtA0c9kbSDpS+z/oT2S+WtRfucI+WN9XhvKmHkDV6+zNSH1FrZbP9FbLtoE
 T8qBdyk//d0GrGnOrPA3Yyka8epd/bXA0js9EuNknyNsHwaFrW4jpGAaIl62iYgb0jCtmoK/
 rCsv2dqS6Hi8w0s23IGjz51cdhdHzkFwuc8/WxI1ewacNNtfGnorXMh6N0g7E/r21pPeMDFs
 rUD9YI1Je/WifL/HbIubHCCdK8/N7rblgUrZJMG3W+7vAvZsOh/6VTZeP4wCe7Gs/cJhE2gI
 DmGcR+7rQvbFQC4zQxEjo8fNaTwjpzLM9NIp4vG9SDIqAm20MXzLBAeVkofixCsosUWUODxP
 owLbpg7pFRJGL9YyEHpS7MGPb3jSLzucMAFXgoI8rVqoq6si2sxr2l0VsNH5o3NgoAgJNIg=
In-Reply-To: <20241021122112.101513-5-puranjay@kernel.org>
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27434/Mon Oct 21 10:49:31 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_064404_662949_69964024 
X-CRM114-Status: UNSURE (   5.24  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMjEvMjQgMjoyMSBQTSwgUHVyYW5qYXkgTW9oYW4gd3JvdGU6Cj4gQWRkIGEgbWljcm9i
ZW5jaG1hcmsgZm9yIGJwZl9jc3VtX2RpZmYoKSBoZWxwZXIuIFRoaXMgYmVuY2htYXJrIHdvcmtz
IGJ5Cj4gZmlsbGluZyBhIDRLQiBidWZmZXIgd2l0aCByYW5kb20gZGF0YSBhbmQgY2FsY3VsYXRp
bmcgdGhlIGludGVybmV0Cj4gY2hlY2tzdW0gb24gZGlmZmVyZW50IHBhcnRzIG9mIHRoaXMgYnVm
ZmVyIHVzaW5nIGJwZl9jc3VtX2RpZmYoKS4KPiAKPiBFeGFtcGxlIHJ1biB1c2luZyAuL2JlbmNo
cy9ydW5fYmVuY2hfY3N1bV9kaWZmLnNoIG9uIHg4Nl82NDoKPiAKPiBbYnBmXSQgLi9iZW5jaHMv
cnVuX2JlbmNoX2NzdW1fZGlmZi5zaAo+IDQgICAgICAgICAgICAgICAgICAgIDIuMjk2IMKxIDAu
MDY2TS9zIChkcm9wcyAwLjAwMCDCsSAwLjAwME0vcykKPiA4ICAgICAgICAgICAgICAgICAgICAy
LjMyMCDCsSAwLjAwM00vcyAoZHJvcHMgMC4wMDAgwrEgMC4wMDBNL3MpCj4gMTYgICAgICAgICAg
ICAgICAgICAgMi4zMTUgwrEgMC4wMDFNL3MgKGRyb3BzIDAuMDAwIMKxIDAuMDAwTS9zKQo+IDIw
ICAgICAgICAgICAgICAgICAgIDIuMzE4IMKxIDAuMDAxTS9zIChkcm9wcyAwLjAwMCDCsSAwLjAw
ME0vcykKPiAzMiAgICAgICAgICAgICAgICAgICAyLjMwOCDCsSAwLjAwM00vcyAoZHJvcHMgMC4w
MDAgwrEgMC4wMDBNL3MpCj4gNDAgICAgICAgICAgICAgICAgICAgMi4zMDAgwrEgMC4wMjlNL3Mg
KGRyb3BzIDAuMDAwIMKxIDAuMDAwTS9zKQo+IDY0ICAgICAgICAgICAgICAgICAgIDIuMjg2IMKx
IDAuMDAxTS9zIChkcm9wcyAwLjAwMCDCsSAwLjAwME0vcykKPiAxMjggICAgICAgICAgICAgICAg
ICAyLjI1MCDCsSAwLjAwMU0vcyAoZHJvcHMgMC4wMDAgwrEgMC4wMDBNL3MpCj4gMjU2ICAgICAg
ICAgICAgICAgICAgMi4xNzMgwrEgMC4wMDFNL3MgKGRyb3BzIDAuMDAwIMKxIDAuMDAwTS9zKQo+
IDUxMiAgICAgICAgICAgICAgICAgIDIuMDIzIMKxIDAuMDU1TS9zIChkcm9wcyAwLjAwMCDCsSAw
LjAwME0vcykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXlAa2Vy
bmVsLm9yZz4KCkFja2VkLWJ5OiBEYW5pZWwgQm9ya21hbm4gPGRhbmllbEBpb2dlYXJib3gubmV0
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
