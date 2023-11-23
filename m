Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B9DC61DF7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0RrtxMsW1hR6hJe6/H0Z5Q6JSlpCP+ypDwWyZVzGR08=; b=JF0GyRvvaB+opl
	nxZM76VlChk71i1A/oYa3Pz8xKD9ZVhrySLbWbNyuIY9P7P4nGxjFxjkXh78Ko1iJi3293e3vewft
	P+/FRArs3Dqm+8wG1klvg2dI+vE2Ksk2RCVbkhoobzr3KoSBH+SRgsu/fYrI+DA+jntVsoW15Pox2
	PQA5IvUkVv/SsD8Dz9YhONPNKTAP9AxnZzr2RoBUci7xNZap9bhETt3lfhhA1dt2tMOARcEHgw3Yb
	ti3aEPN2NaRXAl611s+QapTbYwj9nE9bdC+dI62kKHnvQno9tK92eNbJ3GQMK+szXrQLAubUEX9hZ
	mBnSRusst7DAjDF7V/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AxG-0053nI-2O;
	Thu, 23 Nov 2023 14:45:22 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AxD-0053mK-1a
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 14:45:20 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-359c22c44d6so3276715ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 06:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700750716; x=1701355516; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuvt9r8KOWX1BiAT/c30zg7sLb0Byjj11/nVghaWWms=;
        b=BrlthN/ob83iQhy1FNmwxtWOgFbw46ykQIwah5sDcjHNi8t9L/w0G2crbnMPj6ySAx
         Fs5LuJalNKoMxV779f8DHUpMTjYwJ5zmX7fSnxNZo1oqesoHU/X7cX9CibtDa0O6QU8I
         hIFdPQlB98ljjB2b3JZJTgllGDeCv11vSDzXgAM1+Oxtj0mncqgnbSpG1a5HsxTCtJ8J
         ntomKDkjf8C/4+Vo3RVffZQk4N3aGZcejNkQl3j7tL21rFZobskgXtxr5WVMfQbTWcKT
         ISiJF/s29W9EDwxFvMYkc6eROiT4u6Ipbj2cKfv9sfyNBFjcB1FF01Ns4juhF6M8dM5q
         nYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750716; x=1701355516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuvt9r8KOWX1BiAT/c30zg7sLb0Byjj11/nVghaWWms=;
        b=rasBVOztCBxeqO7Kciyw/qLppoGg/yutSnAlgl96jugojBpdmrVbl30TW6TNfCkgTt
         eS+luGGRfYn31macyAyoDUx1lsb8g6AE7SIVjRkbqD7bG8/PL41ID8BEm0kGon91jruU
         KsHArIG+up2Knaed31iG3gldiWjqeQPnDnwZTZX7GJX7fUZa57xYXzpMAiDh63PwXg6I
         /8fY3muZAF/FOlTv92KeHZAw/qHiWggcvJtCvaTfqtltnfJbMEHhDYQ03TIe7ZOP+mzZ
         fzatFUHODW/YhNU/cDzZHe6iR/VCUaO12paSO47AaW/GcFd5AsqvMEhuMB9fcV6yn273
         2NAg==
X-Gm-Message-State: AOJu0YzKSxu7nACIGE/XhPuwIyOHVFlWdPvf4WWjlz5clV5B2VdyLeTE
	4TDoHjdjZvGPJlW3Bh7z+a+D8g==
X-Google-Smtp-Source: AGHT+IE6CculVp3F9Rtnr1OLtgszPmbMIieHBv875RrP/HPj2Ga5BLKHDujelRLOHcuKwZeQTRYzTQ==
X-Received: by 2002:a05:6e02:1285:b0:34f:70ec:d4cf with SMTP id y5-20020a056e02128500b0034f70ecd4cfmr5459643ilq.8.1700750716253;
        Thu, 23 Nov 2023 06:45:16 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:8976:165c:1b8d:1b61? ([2605:a601:adae:4500:8976:165c:1b8d:1b61])
        by smtp.gmail.com with ESMTPSA id s2-20020a056e021a0200b0035aeaed5112sm391231ild.84.2023.11.23.06.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 06:45:16 -0800 (PST)
Message-ID: <313e9a3e-0fe5-45e1-a164-1d55fb52898a@sifive.com>
Date: Thu, 23 Nov 2023 08:45:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] RISC-V: Add stubs for
 sbi_console_putchar/getchar()
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-2-apatel@ventanamicro.com>
 <70ff59ea-378c-4d53-899a-eafffcad22fd@sifive.com>
 <CAK9=C2U9aJDDd0JUhRqyLCF3dfyY5QBUrgyH+PKsT+pUKiB1xQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAK9=C2U9aJDDd0JUhRqyLCF3dfyY5QBUrgyH+PKsT+pUKiB1xQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_064519_557120_910998BA 
X-CRM114-Status: GOOD (  12.47  )
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

SGkgQW51cCwKCk9uIDIwMjMtMTEtMjMgNDozOCBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBX
ZWQsIE5vdiAyMiwgMjAyMyBhdCA0OjA24oCvQU0gU2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+IE9uIDIwMjMtMTEtMTcgOTozOCBQTSwgQW51cCBQ
YXRlbCB3cm90ZToKPj4+IFRoZSBmdW5jdGlvbnMgc2JpX2NvbnNvbGVfcHV0Y2hhcigpIGFuZCBz
YmlfY29uc29sZV9nZXRjaGFyKCkgYXJlCj4+PiBub3QgZGVmaW5lZCB3aGVuIENPTkZJR19SSVND
Vl9TQklfVjAxIGlzIGRpc2FibGVkIHNvIGxldCB1cyBhZGQKPj4+IHN0dWIgb2YgdGhlc2UgZnVu
Y3Rpb25zIHRvIGF2b2lkICIjaWZkZWYiIG9uIHVzZXIgc2lkZS4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPj4+IFJldmlld2VkLWJ5
OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Pj4gLS0tCj4+PiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8IDUgKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+PiBpbmRleCAwODkyZjQ0
MjFiYzQuLjY2ZjM5MzNjMTRmNiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4+IEBAIC0y
NzEsOCArMjcxLDEzIEBAIHN0cnVjdCBzYmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGludCBmaWQs
IHVuc2lnbmVkIGxvbmcgYXJnMCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGFyZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGFyZzUpOwo+Pj4KPj4+ICsjaWZkZWYgQ09ORklHX1JJU0NWX1NCSV9WMDEK
Pj4+ICB2b2lkIHNiaV9jb25zb2xlX3B1dGNoYXIoaW50IGNoKTsKPj4+ICBpbnQgc2JpX2NvbnNv
bGVfZ2V0Y2hhcih2b2lkKTsKPj4+ICsjZWxzZQo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzYmlf
Y29uc29sZV9wdXRjaGFyKGludCBjaCkgeyB9Cj4+PiArc3RhdGljIGlubGluZSBpbnQgc2JpX2Nv
bnNvbGVfZ2V0Y2hhcih2b2lkKSB7IHJldHVybiAtRU5PRU5UOyB9Cj4+Cj4+ICJUaGUgU0JJIGNh
bGwgcmV0dXJucyB0aGUgYnl0ZSBvbiBzdWNjZXNzLCBvciAtMSBmb3IgZmFpbHVyZS4iCj4+Cj4+
IFNvIC1FTk9FTlQgaXMgbm90IHJlYWxseSBhbiBhcHByb3ByaWF0ZSB2YWx1ZSB0byByZXR1cm4g
aGVyZS4KPiAKPiBBY3R1YWxseSwgSSBoYWQgLTEgb3ZlciBoZXJlIHByZXZpb3VzbHkgYnV0IGJh
c2VkIG9uIEdyZWdLSCdzCj4gc3VnZ2VzdGlvbiwgd2UgYXJlIG5vdyByZXR1cm5pbmcgcHJvcGVy
IExpbnV4IGVycm9yIGNvZGUgaGVyZS4KPiAKPiBBbHNvLCBhbGwgdXNlcnMgb2Ygc2JpX2NvbnNv
bGVfZ2V0Y2hhcigpIG9ubHlsIGV4cGVjdCBhIG5lZ2F0aXZlCj4gdmFsdWUgdXBvbiBlcnJvciBz
byBiZXR0ZXIgdG8gcmV0dXJuIHByb3BlciBMaW51eCBlcnJvciBjb2RlLgoKQWxyaWdodCwgbWFr
ZXMgc2Vuc2UgdG8gbWUuCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
