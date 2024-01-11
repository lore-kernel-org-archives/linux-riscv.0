Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2CAC47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5xDps3YFygFLvGch8HDS+3MBzgDHaLFL2jw1ajwzP0=; b=h4atQ0/E/NUAnY
	K/oUvIgSJO34fJ3dJLY/bNlgYjIqNE6qe9Mku8exiSBvdOAyNnS+lnOH9r9NudJhQ2XJj6zf57n7x
	pRIBT+9/rEuJ84r5i7qO2dh75rw7cwjydIRs3tyZLRVHIb7FA47LFMg/M12MM6bu/1IjPxbAKi+RZ
	5XlA3DuSqDrYiTDg1yGWoIOFhwlJpvZ+ySeLhvQOgOy32vVAVsf9eWu0nMo8Nc50x85R8XsPKvLdb
	eLzYTndgkt8RX/YFq++TmhaC6YKiVe27v/oV6sZiCWwxSZrRGN0dTevKgGxXOEi2qD4zzvTr15NJw
	vJ7CJHzYrTS/4Bz756xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsdI-00H5HF-1a;
	Thu, 11 Jan 2024 10:49:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsdG-00H5GB-0l
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 10:49:55 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2cd6c0b7dbbso5359991fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 02:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704970191; x=1705574991; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1dTcljljjbzC/kh3vHpEuL3WEnDjy1A0qz4miGt7qo=;
        b=rcr3g4afGiqGt46QmlDw1gGqIwhAxL8Gx7D4hqY7kGNKdl3eLft9HTdu8M/c446x7I
         negydQniC3vWBYXyEWwiB+xlG1muKusk8RhUqa8r/M6t6JwGDeaIMV1ifnZN4/IWvKaQ
         37QJvp5vk3NLGcIQSwtUO2h+nplnL5Vn25cl9HkLONch/Dcoo0k5mhxUf+K/1xnvCe2G
         KB838U7ryDUMxgC53ywTz//wO9z6PGuotVK5jXpMNsNq4j6ldsWugLXKiFwZQG2mj6Wl
         dQa4+jJx8+YXHng9gfEbk+onxnw8MotSQZSP7A0IlzM7cruGxhwUscxHdaOf+k2sVdVO
         EmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704970191; x=1705574991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s1dTcljljjbzC/kh3vHpEuL3WEnDjy1A0qz4miGt7qo=;
        b=Trc0rV9ffmbXoHuP8LomHbhFIAj29rJQGPlhJ9FD7FeoS5aZNTh4uEo5OfwB/9zFuC
         QXXTAvNrRNoMFoRR8KOifq5ipeKjnUYN9SbE1JbYK5y7zWWITGllOHU7ivuDJLT0MzKT
         Kwr3QQME6i3/AVBTk52OQZRrMhWjqKUOlYjVs/GzTXbQ7gKHd9hoDtBdvg9Bo53nTId+
         gYzniTDtTPsxwUoSDQGOjVO+3vYdl72WrfNVKeuewzyhzi1WV1hvTuVoYcQ+YnXTTnCl
         7nLbQnzQ17SesSsE+iPj4j4PRGI5hj6BLE4hCkTBBBbd0QKwEgNnwOlfuAqUkJ2DUAQ2
         0Dzg==
X-Gm-Message-State: AOJu0Yy9oZllqnCjmiFjf1q35o+j4rfX9ktZiwa3yWponUfnYtJO7eV7
	W8Kl77doUgAZw3z63YVgIbgnkGSV/PBcBA==
X-Google-Smtp-Source: AGHT+IEL/miHMbrsEIJ3YKGjGRju9tM/OC4JSiDh6ozMI3LPqM42XTQcwyS/+vFSR2fdmi7Ow55Ekg==
X-Received: by 2002:a2e:860c:0:b0:2cd:3337:6729 with SMTP id a12-20020a2e860c000000b002cd33376729mr1118430lji.3.1704970190789;
        Thu, 11 Jan 2024 02:49:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:bf36:e934:b395:fd62? ([2a01:e0a:999:a3a0:bf36:e934:b395:fd62])
        by smtp.gmail.com with ESMTPSA id k11-20020a2e92cb000000b002cd7a4a2611sm104933ljh.35.2024.01.11.02.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 02:49:50 -0800 (PST)
Message-ID: <78afc7ce-c6ce-4edd-b91a-1f8a94ce298a@rivosinc.com>
Date: Thu, 11 Jan 2024 11:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions &
 cpufeature
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
 <6bce1adb-6808-40df-8dd7-b0b2c6031547@rivosinc.com>
 <20240103-77f6b0856efb7a9f4591c53b@orel>
 <331610f6-9987-4d1b-8d57-f21311a43f5d@rivosinc.com>
 <20240111-416377ebfcaff924b71fb419@orel>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240111-416377ebfcaff924b71fb419@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_024954_281403_F3ACE7B1 
X-CRM114-Status: GOOD (  23.26  )
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
Cc: panqinglin2020@iscas.ac.cn, Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org, wefu@redhat.com, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, linux-kernel@vger.kernel.org, bjorn@rivosinc.com, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8wMS8yMDI0IDExOjQ1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MTEsIDIwMjQgYXQgMTE6MzE6MzJBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwMy8wMS8yMDI0IDEzOjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBXZWQs
IEphbiAwMywgMjAyNCBhdCAxMDozMTozN0FNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDMxLzEyLzIwMjMgMDk6MjksIGd1b3JlbkBrZXJuZWwub3JnIHdy
b3RlOgo+Pj4+PiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+Pj4+
Cj4+Pj4+IENhY2hlLWJsb2NrIHByZWZldGNoIGluc3RydWN0aW9ucyBhcmUgSElOVHMgdG8gdGhl
IGhhcmR3YXJlIHRvCj4+Pj4+IGluZGljYXRlIHRoYXQgc29mdHdhcmUgaW50ZW5kcyB0byBwZXJm
b3JtIGEgcGFydGljdWxhciB0eXBlIG9mCj4+Pj4+IG1lbW9yeSBhY2Nlc3MgaW4gdGhlIG5lYXIg
ZnV0dXJlLiBUaGlzIHBhdGNoIGFkZHMgcHJlZmV0Y2guaSwKPj4+Pj4gcHJlZmV0Y2guciBhbmQg
cHJlZmV0Y2gudyBpbnN0cnVjdGlvbiBkZWZpbml0aW9ucyBieQo+Pj4+PiBSSVNDVl9JU0FfRVhU
X1pJQ0JPUCBjcHVmZWF0dXJlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgo+Pj4+PiAtLS0KPj4+Pj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAg
ICAgICAgICAgICB8IDE1ICsrKysrKysrCj4+Pj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmggICAgfCAgMSArCj4+Pj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmgg
fCA2MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgICAgfCAgMSArCj4+Pj4+ICA0IGZpbGVzIGNoYW5nZWQsIDc3IGlu
c2VydGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBi
L2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4+PiBpbmRleCAyNGMxNzk5ZTJlYzQuLmZjYmQ0MTdkNjVl
YSAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+Pj4+ICsrKyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwo+Pj4+PiBAQCAtNTc5LDYgKzU3OSwyMSBAQCBjb25maWcgUklTQ1ZfSVNB
X1pJQ0JPWgo+Pj4+PiAgCj4+Pj4+ICAJICAgSWYgeW91IGRvbid0IGtub3cgd2hhdCB0byBkbyBo
ZXJlLCBzYXkgWS4KPj4+Pj4gIAo+Pj4+PiArY29uZmlnIFJJU0NWX0lTQV9aSUNCT1AKPj4+Pj4g
Kwlib29sICJaaWNib3AgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIGNhY2hlIGJsb2NrIHByZWZldGNo
Igo+Pj4+PiArCWRlcGVuZHMgb24gTU1VCj4+Pj4+ICsJZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5B
VElWRQo+Pj4+PiArCWRlZmF1bHQgeQo+Pj4+PiArCWhlbHAKPj4+Pj4gKwkgIEFkZHMgc3VwcG9y
dCB0byBkeW5hbWljYWxseSBkZXRlY3QgdGhlIHByZXNlbmNlIG9mIHRoZSBaSUNCT1AKPj4+Pj4g
KwkgIGV4dGVuc2lvbiAoQ2FjaGUgQmxvY2sgUHJlZmV0Y2ggT3BlcmF0aW9ucykgYW5kIGVuYWJs
ZSBpdHMKPj4+Pj4gKwkgIHVzYWdlLgo+Pj4+PiArCj4+Pj4+ICsJICBUaGUgWmljYm9wIGV4dGVu
c2lvbiBjYW4gYmUgdXNlZCB0byBwcmVmZXRjaCBjYWNoZSBibG9jayBmb3IKPj4+Pj4gKwkgIHJl
YWQvd3JpdGUgZmV0Y2guCj4+Pj4+ICsKPj4+Pj4gKwkgIElmIHlvdSBkb24ndCBrbm93IHdoYXQg
dG8gZG8gaGVyZSwgc2F5IFkuCj4+Pj4+ICsKPj4+Pj4gIGNvbmZpZyBUT09MQ0hBSU5fSEFTX1pJ
SElOVFBBVVNFCj4+Pj4+ICAJYm9vbAo+Pj4+PiAgCWRlZmF1bHQgeQo+Pj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4+Pj4+IGluZGV4IDA2ZDMwNTI2ZWYzYi4uNzdkM2I2ZWUyNWFiIDEwMDY0NAo+
Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4+Pj4+IEBAIC01Nyw2ICs1Nyw3IEBACj4+Pj4+
ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklIUE0JCTQyCj4+Pj4+ICAjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfU01TVEFURUVOCQk0Mwo+Pj4+PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ09ORAkJ
NDQKPj4+Pj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNCT1AJCTQ1Cj4+Pj4KPj4+PiBIaSBH
dW8sCj4+Pj4KPj4+PiBTaW5jZSB5b3UgYXJlIGFkZGluZyBzdXBwb3J0IGZvciB0aGUgWmljYm9w
IGV4dGVuc2lvbiwgeW91IGNvdWxkCj4+Pj4gcHJvYmFibHkgYWxzbyBhbGxvdyB0byBwcm9iZSBp
dCBmcm9tIHVzZXJzcGFjZSB1c2luZyBod3Byb2JlLiBBZGQgYSBmZXcKPj4+PiBkZWZpbml0aW9u
cyB0byBzeXNfcmlzY3YuYy9od3Byb2JlLmggYW5kIGl0IHdpbGwgYmUgZmluZS4KPj4+Cj4+PiBU
byBleHBvc2UgdG8gdXNlcnNwYWNlLCB3ZSBzaG91bGQgYWxzbyBzdGFydCBwYXJzaW5nIHRoZSBi
bG9jayBzaXplLAo+Pj4gc28gaXQgY2FuIGFsc28gYmUgZXhwb3NlZCB0byB1c2Vyc3BhY2UuIFN0
YXJ0aW5nIHRvIHBhcnNlIHRoZSBibG9jawo+Pj4gc2l6ZSBmaXJzdCByZXF1aXJlcyB0aGF0IHdl
IGRlY2lkZSB3ZSBuZWVkIHRvIHBhcnNlIHRoZSBibG9jayBzaXplCj4+PiAoc2VlIFsxXSkuCj4+
Cj4+IEhpIEFuZHJldywgdGhhbmtzIGZvciB0aGUgdGhyZWFkLgo+Pgo+PiBJIHJlYWQgaXQgKGFu
ZCB0aGUgb3RoZXIgb25lcyB0aGF0IGFyZSByZWxhdGVkIHRvIGl0KSBhbmQgYmFzaWNhbGx5LCBp
dAo+PiBzZWVtcyB0aGVyZSB3YXMgYSBmaXJzdCBkZWNpc2lvbiAoZXhwb3NlIFppY2JvcCBibG9j
ayBzaXplIGluZGl2dWRhbGx5KQo+PiBkdWUgdG8gdGhlIGZhY3QgdGhlIHNwZWNpZmljYXRpb24g
ZGlkIG5vdCBtZW50aW9uZWQgYW55dGhpbmcgc3BlY2lmaWMKPj4gYWJvdXQgY2xvY2sgc2l6ZXMg
IGJ1dCB0aGVuIGFmdGVyIHRoYXQsIHRoZXJlIHdhcyBhIGNsYXJpZmljYXRpb24gaW4gdGhlCj4+
IHNwZWMgc3RhdGluZyB0aGF0IFppY2JvcCBhbmQgWmljYm9tIGhhdmUgdGhlIHNhbWUgYmxvY2sg
c2l6ZSBzbyB0aGUKPj4gZmlyc3QgZGVjaXNpb24gd2FzIHF1ZXN0aW9uZWQgYWdhaW4uCj4+Cj4+
IEZyb20gYSB1c2VyIGNvaGVyZW5jeSBwb2ludCBvZiB2aWV3LCBJIHRoaW5rIGl0IHdvdWxkIG1h
a2UgbW9yZSBzZW5zZSB0bwo+PiBleHBvc2UgaXQgaW5kaXZpZHVhbGx5IGluIGh3cHJvYmUgIHNv
IHRoYXQgemljYm96LCB6aWNib3AgYW5kIHppY2JvbQo+PiBoYXZlIHRoZWlyICJvd24iIGJsb2Nr
IHNpemUgKGV2ZW4gdGhvdWdoIHppY2JvcCBhbmQgemljYm9tIHdvdWxkIHVzZSB0aGUKPj4gc2Ft
ZSBvbmUpLiBNb3Jlb3ZlciwgaXQgd291bGQgYWxsb3cgdXMgZm9yIGZ1dHVyZSBldm9sdXRpb24g
ZWFzaWx5Cj4+IHdpdGhvdXQgYnJlYWtpbmcgYW55IHVzZXJzcGFjZSBsYXRlciBpZiB6aWNib3Ag
YW5kIHppY2JvbSBibG9jayBzaXplIGFyZQo+PiBkZWNvdXBsZWQuCj4gCj4gSSBhZ3JlZSBhbmQg
UUVNVSBoYXMgYWxyZWFkeSBoZWFkZWQgZG93biB0aGUgcm9hZCBvZiBnZW5lcmF0aW5nCj4gcmlz
Y3YsY2JvcC1ibG9jay1zaXplIChJIGd1ZXNzIENvbm9yJ3MgYWNrIG9uIFsxXSB3YXMgaW50ZXJw
cmV0ZWQgYXMKPiBiZWluZyBzdWZmaWNpZW50IHRvIG1lcmdlIHRoZSBRRU1VIGJpdHMpLCBzbyB3
ZSBjYW4gYWRkIHRoZSBMaW51eAo+IHN1cHBvcnQgYW5kIHRlc3Qgd2l0aCBRRU1VIG5vdy4gVGhl
IHdvcmsgY291bGQgcHJvYmFibHkgYmUgYSBzZXBhcmF0ZQo+IHNlcmllcyB0byB0aGlzIG9uZSwg
dGhvdWdoLgoKWWVzLCBpdCBRRU1VIGhhZCBpdCBtZXJnZWQuIGFuZCBhZ3JlZWQsIHNpbmNlIHRo
aXMgcmVxdWlyZXMgYSBiaXQgbW9yZQpwbHVtYmluZywgaXQgY2FuIHByb2JhYmx5IGJlIGxlZnQg
b3V0IG9mIHRoaXMgc2VyaWVzLiBJIGNvdWxkIHByb2JhYmx5CnRha2UgY2FyZSBvZiB0aGF0IGxh
dGVyLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
