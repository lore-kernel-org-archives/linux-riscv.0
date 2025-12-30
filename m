Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF19EE4990
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfUek+yQmo5JMWmb0DLeK2tedM0wKDVjWzPzhc4gPGQ=; b=2g7fbPKNLGJgtk
	YDJS0k4nY28GVpt2X19mrhpqeqS1DH+H52BciLTg3wx6dmmYR3jU/+Q+jWx/3ECG6XVmFsD5yKbA6
	xPNiqFiTMcGClAvcGxr6znXjuzwOmuUCjDdM76ugMnqx7cmwJL0UdgUjbpAHn7OoBXQH0SZWTuX9F
	577IJWcwtJHZEKD8SSaAkyq2VGWw7F+FDdi/wGKMcDC/bag4pQUlewSd/yfB+NipNcp7QlDwHV5zo
	z6SyxasZ0aVYxFWvbqATlXCzCrTgWFiznX7koElON+YRRua5bbZe4cPfehsDHgz2ITq1jjupp7i4y
	HDQ1ae7CUCAxeMDLzEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae2U-000000059pB-2AsU;
	Tue, 30 Dec 2025 18:01:46 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae2R-000000059oq-2OmP
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 18:01:45 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3ec5df386acso7257447fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 10:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767117702; x=1767722502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLZJiVuRd6YrPeNX7NwPmCHPzKyPI+OhqBEP3ZsDFnU=;
        b=X5RU0D9rC6ojwEkLgRud1CLI5QmEoSUs/s+WmHG4yQBFcsQFLjHhEmkKAHM6RL9m8P
         A4L6kVt6Ws2fwcbvXIfJdwPz9CyZuHmU4PdStavGdOEqj1oR9oaOmC2gkgycLy3yGGPF
         zVCfCf6v0pt5fFIfouf0GUEEPjGSBdMhom95lDYi3MPSJbc86Pp7D4gJ4ZAGc2IHRwOj
         g9Zk1j0cB6aRuq09wUbICMZEpatQ4GJ1lASd6ZFsm36EEPdScxMj6oldnQC/DMEdrMrq
         Jr65XTYKBIFDi5LR7cStrtE1GRlz/R/E1DiqlwyzHyO1V66ud/7bxo+UVmP/8dwfcoZ8
         5y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767117702; x=1767722502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLZJiVuRd6YrPeNX7NwPmCHPzKyPI+OhqBEP3ZsDFnU=;
        b=pLTodZgFKxecFiS+GeLUiIOHdiksY+LDDAfK1ac45/z5aa3NlQrNCS4C50hK091KUb
         CeSWqSEofbSAs3MH9TVRf9r7I07WdMWk+fhljBsH+Sc+W8k4oFDovf92FX94Q1x34+5S
         bBHFfLCaZX89jaHZIt17nA23DZnr1Shw/YK6WzGvD8xbn+LtUwXUuLsCeSd0POjBC68i
         PLiYAgv7t3CoPpGbf7Qyh/XkrGtJbpirhVN6/DhcV4PWMEGAU+yuH4l+9Ge3rE2pmMV3
         YMuRRzN4/RBE5ffLVzl1P74XmRJpDiHya+/VwMOFO+4Yrvc9WXMg18aPSGHjBNaiVG06
         qSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnXsjj5T1uxzNc60/H/U8jlC6PfpeYJbfJc5r1iUpqH2vvW6ZveI+7Lr3icyhbw1AMAzz80H541EOQWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJLM+OVEabtMkiLsFjyQhEXkjKBX4ddmkEmtP5vmk9+b3vkQbc
	vWT8mc6k9aUyO/1LPe0Ckga9GtjO+BVQv3aFdRp/uPPKKorNOldXYrliOYuSnMyL0P4=
X-Gm-Gg: AY/fxX5bEUVG12zwAyWPbcOm/HRf6pFKzw8i8VlA0BMFNuI/bw+8X9krG4fKBhSuoJu
	634oFhKMFx2wb0fBCO3BBeHzcpGS/kOoUDldMY+tYd/Gt6pzBwdqjUzXWvXOPLMSjqHbQmvnGAf
	InY5mZbRHdybc3WTUKfXIsFmkvuwUrKWxXyo2wuKNX0bFM/2wpqxI4vK5SkzINM9etkEbuv/5DN
	mV07TbC5z387mJtPRoQMI1ss9jCr9N1dNP11JXCdYQvl9OWHKLXYzBHx4ssyv3xQ3xFtFpkSDMd
	qDtbnpQQF4dA1cp6afoDH2HEuCixbijbi+ylGxrg4ulPjLGtxLTWOHe4Qlqe2L+h9m4WJod8S34
	Ic/iXY5Z3wWgR6L493qh/pTB/MsX18qtaGTL5/3JB+hgaS48OWulyTpte7g5N6mQ+HR8YAtKgz2
	ZO2CqGvFVr9K5kagQSXVraJ0zfL5v8N+2TLPRzuM+6iL5qQ4OC5E8=
X-Google-Smtp-Source: AGHT+IGi1m7SjVdJNAYRLqjlgNp7VArCjUE4lgUnF+WYS7qgsHMtSCI3u2nAje+cfetZUiRTlAYy+w==
X-Received: by 2002:a05:6820:4309:b0:659:9a49:8eaf with SMTP id 006d021491bc7-65d0eb2ef39mr10935767eaf.51.1767117701855;
        Tue, 30 Dec 2025 10:01:41 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096a8c2ecsm2612131785a.23.2025.12.30.10.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:01:41 -0800 (PST)
Message-ID: <2ab3f704-22ef-4e75-bedf-95c1956e312b@riscstar.com>
Date: Tue, 30 Dec 2025 12:01:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
To: Rob Herring <robh@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org>
 <80e18a32-543a-48f5-81f2-4fa64cb8bf8c@riscstar.com>
 <CAL_JsqK8hRsVWV6WfbZ6hF1PwFfOJhyOrpWwoOhviAgv5ZxKUw@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAL_JsqK8hRsVWV6WfbZ6hF1PwFfOJhyOrpWwoOhviAgv5ZxKUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_100144_582616_278802B2 
X-CRM114-Status: GOOD (  47.75  )
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

T24gMTIvMzAvMjUgOToyMSBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gTW9uLCBEZWMgMjks
IDIwMjUgYXQgOToxNOKAr1BNIEFsZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNvbT4gd3JvdGU6
Cj4+Cj4+IE9uIDEyLzI5LzI1IDg6MTMgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4gT24gRnJp
LCBEZWMgMjYsIDIwMjUgYXQgMDM6Mjg6NDdQTSAtMDYwMCwgQWxleCBFbGRlciB3cm90ZToKPj4+
PiBPbiAxMi8yMi8yNSA3OjA0IEFNLCBHdW9kb25nIFh1IHdyb3RlOgo+Pj4+PiBBZGQgZGVzY3Jp
cHRpb24gZm9yIHRoZSBTdXBtIGV4dGVuc2lvbi4gU3VwbSBpbmRpY2F0ZXMgc3VwcG9ydCBmb3Ig
cG9pbnRlcgo+Pj4+PiBtYXNraW5nIGluIHVzZXIgbW9kZS4gU3VwbSBpcyBtYW5kYXRvcnkgZm9y
IFJWQTIzUzY0Lgo+Pj4+Pgo+Pj4+PiBUaGUgU3VwbSBleHRlbnNpb24gaXMgcmF0aWZpZWQgaW4g
Y29tbWl0IGQ3MDAxMWRkZTZjMiAoIlVwZGF0ZSB0byByYXRpZmllZAo+Pj4+PiBzdGF0ZSIpIG9m
IHJpc2N2LWotZXh0ZW5zaW9uLgo+Pj4+Pgo+Pj4+PiBTdXBtIGRlcGVuZHMgb24gZWl0aGVyIFNt
bnBtIG9yIFNzbnBtLCBzbyBhZGQgYSBzY2hlbWEgY2hlY2sgdG8gZW5mb3JjZQo+Pj4+PiB0aGlz
IGRlcGVuZGVuY3kuCj4+Pj4KPj4+PiBJIGhhdmUgdGhlIHNhbWUgZ2VuZXJhbCBxdWVzdGlvbiBv
biB0aGlzLCBhYm91dCB3aGV0aGVyIGl0J3MgcmVhbGx5Cj4+Pj4gbmVjZXNzYXJ5IGZvciB0aGUg
RFQgYmluZGluZyB0byBlbmZvcmNlIHRoZXNlIHJlcXVpcmVtZW50cy4gIFRoZQo+Pj4+IFJJU0Mt
ViBzcGVjaWZpY2F0aW9ucyBhcmUgd2hhdCB0cnVseSBkZWZpbmVzIHRoZWlyIG1lYW5pbmcsIHNv
IEkKPj4+PiBkb24ndCByZWFsbHkgc2VlIHdoeSB0aGUgRFQgZnJhbWV3b3JrIHNob3VsZCBuZWVk
IHRvIGVuZm9yY2UgdGhlbS4KPj4+PiAoVGhhdCBzYWlkLCBJJ20gc3VyZSB0aGVyZSBhcmUgb3Ro
ZXIgY2FzZXMgd2hlcmUgRFQgZW5mb3JjZXMgdGhpbmdzCj4+Pj4gaXQgc2hvdWxkbid0IGhhdmUg
dG8uKQo+Pj4KPj4+IERvZXMgdGhlIHNwZWNpZmljYXRpb24gaGF2ZSBzb21lIHdheSB0byBjaGVj
ayBpdD8gV2hhdCBoYXBwZW5zIGlmIGEgRFQKPj4+IGlzIHdyb25nPyBBcmUgeW91IGdvaW5nIHRv
IHJlcXVpcmUgYSBEVCB1cGRhdGUgdG8gbWFrZSB0aGluZ3MgcmlnaHQ/IE9yCj4+PiB0aGUga2Vy
bmVsIGhhcyB0byB3b3JrLWFyb3VuZCB0aGUgZXJyb3I/IE5laXRoZXIgaXMgZ3JlYXQuIFNvIGhh
dmluZwo+Pj4gdGhpcyBhcyBhIHNjaGVtYSBtYWtlcyBzZW5zZSB0byBwcmV2ZW50IGVpdGhlciBz
Y2VuYXJpby4KPj4KPj4gSSdtIHJlYWxseSBnbGFkIHlvdSB3ZWlnaGVkIGluLiAgSSBhY3R1YWxs
eSBoYXZlIHNldmVyYWwgcXVlc3Rpb25zCj4+IHJlbGF0ZWQgdG8gUklTQy1WIGV4dGVuc2lvbnMg
YW5kIERULiAgQnV0IGZvciBub3cgSSdsbCBmb2N1cyBvbgo+PiBqdXN0IHRoaXMuLi4KPj4KPj4g
VG8gYW5zd2VyIHlvdXIgZmlyc3QgcXVlc3Rpb24sIEknbSBub3Qgc3VyZSBob3cgdGhlIHNwZWNp
ZmljYXRpb24KPj4gaXMgImNoZWNrZWQiLCBvciB3aGF0ICJpdCIgaXMgdGhhdCB5b3UncmUgYXNr
aW5nIGFib3V0IGZvciB0aGF0Cj4+IG1hdHRlci4gIEFsc28gSSB0aGluayB3ZSBoYXZlIHRvIGJl
IGNsZWFyIGFib3V0IHdoYXQgIndyb25nIiBtZWFucy4KPj4KPj4gUklTQy1WIGlzIGRlZmluZWQg
YnkgYSAobGFyZ2UgYW5kIGdyb3dpbmcpIHNldCBvZiBzcGVjaWZpY2F0aW9ucwo+PiB0aGF0IGFy
ZSBkZXZlbG9wZWQgdGhyb3VnaCBhIHdlbGwtZGVmaW5lZCBwcm9jZXNzLiAgV2hlbiBhIHNwZWMK
Pj4gaXMgKnJhdGlmaWVkKiBpdCBpcyBjb21taXR0ZWQsIGFuZCBpdCB3b24ndCBiZSBjaGFuZ2Vk
LiAgVGhlc2UKPj4gc3BlY2lmaWNhdGlvbnMgYXJlIHVsdGltYXRlbHkgKnRoZSogZGVmaW5pdGlv
biBvZiBSSVNDLVYKPj4gY29tcGxpYW5jZS4KPj4KPj4gSSBhc3N1bWVkIHRoZSAid3JvbmciIHlv
dSdyZSB0YWxraW5nIGFib3V0IGlzIGEgRFRTL0RUQiB0aGF0IGhhcwo+PiBiZWVuIGNvbW1pdHRl
ZCBidXQgc29tZWhvdyBkb2VzIG5vdCBtYXRjaCB3aGF0IGEgUklTQy1WIHNwZWMKPj4gc2F5cywg
YnV0IEkgbWlnaHQgYmUgbWlzdGFrZW4uCj4gCj4gVGhhdCdzIGNvcnJlY3QuCj4gCj4+IEFueXdh
eSwgd2UgY2FuIGZsaXAgdGhhdCBhcm91bmQgYW5kIGhhdmUgYSBzaW1pbGFyIHByb2JsZW06ICBX
aGF0Cj4+IGlmIHdlIGRlZmluZSB0aGUgRFQgYmluZGluZyBpbiBzdWNoIGEgd2F5IHRoYXQgaXQg
ZG9lc24ndCBtYXRjaAo+PiB0aGUgUklTQy1WIHNwZWM/ICBUaGUgKHJhdGlmaWVkKSBSSVNDLVYg
c3BlYyBpcyByaWdodC4KPiAKPiBTdXJlLiBBbnkgdGltZSB0aGVyZSBpcyBtb3JlIHRoYW4gMSBz
b3VyY2Ugb2YgdHJ1dGgsIHRoZXkgY291bGQgYmUKPiBtaXNtYXRjaGVkLiBCdXQgaXQgaXMgMSBz
cGVjIGFuZCAxIHNjaGVtYSB0byBjb21wYXJlLCBub3QgTiBEVFMgZmlsZXMuCj4gQ2hlY2tpbmcg
dGhlIHNjaGVtYSBtYXRjaGVzIHRoZSBzcGVjIGlzIG11Y2ggZWFzaWVyIHRoYW4gcmV2aWV3aW5n
Cj4gZXZlcnkgbmV3IERUUyBmaWxlLgoKWWVzLCBJIHVuZGVyc3RhbmQgdGhhdCBhbmQgSSBhZ3Jl
ZS4gIFdlICpkbyogaGF2ZSB0b29scyB0bwp2ZXJpZnkgRFQgZmlsZXMgYWdhaW5zdCBiaW5kaW5n
cywgYW5kIGF0IGxlYXN0IGluIHRoaXMKZG9tYWluIHdlIGRvbid0IGhhdmUgdG9vbHMgdG8gdmVy
aWZ5IGFnYWluc3QgdGhlIFJJU0MtVgpzcGVjcy4KCj4gVGhlIG9ubHkgdHJ1ZSBmaXggaXMgdG8g
bWFrZSB0aGUgc3BlYyBtYWNoaW5lIHJlYWRhYmxlLgoKQnV0IGJhcnJpbmcgdGhhdCwgd2UgY2Fu
IGRlZmluZSB0aGUgRFQgYmluZGluZyBhbmQgdHJ5IHRvCmVuc3VyZSBpdCBleGFjdGx5IG1hdGNo
ZXMgdGhlIFJJU0MtViBzcGVjcy4KCj4+IE15IHRob3VnaHQgd2FzIHRoYXQgd2Ugc2hvdWxkIGhh
dmUgc29mdHdhcmUgZG8gdGhlIHZlcmlmaWNhdGlvbiwKPj4gYW5kIHJlY29tbWVuZCB0aGUgc29m
dHdhcmUgKGUuZy4gYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+IGluIExpbnV4KSBi
ZSB1cGRhdGVkIHRvIHZlcmlmeSB0aGluZ3MgYmVmb3JlIGNvbW1pdHRpbmcgdG8gYQo+PiBEVCBi
aW5kaW5nLgo+IAo+IFRoYXQgbW92ZXMgdmFsaWRhdGlvbiBmcm9tIGJ1aWxkIHRpbWUgdG8gcnVu
IHRpbWUuIEhvdyBpcyB0aGF0IGJldHRlcj8KPiBBbmQgd2hhdCBhYm91dCBvdGhlciBPU3M/CgpP
SyBJIGNvbmNlZGUgdGhhdCBlbmNvZGluZyB0aGUgbG9naWMgaW4gdGhlIERUIGJpbmRpbmcgaXMK
YSBnb29kIHByYWN0aWNhbCBzb2x1dGlvbiBhbmQgSSB0YWtlIGJhY2sgbXkgc3VnZ2VzdGlvbi4K
Cj4gSSdtIHZlcnkgbXVjaCBvZiB0aGUgb3BpbmlvbiB0aGF0IGl0IGlzIG5vdCB0aGUga2VybmVs
J3Mgam9iIHRvCj4gdmFsaWRhdGUgdGhlIERULiBJdCBvYnZpb3VzbHkgaGFzIG5vdCBkb25lIGEg
dmVyeSBnb29kIGpvYiBnaXZlbgoKVGhpcyBpcyBleGFjdGx5IHdoYXQgSSB3YW50ZWQgeW91ciBv
cGluaW9uIG9uLiAgSSBtZWFuLCBJCmFscmVhZHkgYWdyZWVkIHdpdGggdGhpcyBzdGF0ZW1lbnQs
IGJ1dCB0aGUgZXhpc3RlbmNlIG9mIGEKZGlmZmVyZW50IChSSVNDLVYpIHNwZWMgYXMgYSBzb3Vy
Y2Ugb2YgdHJ1dGggbWFkZSBtZSBjb25zaWRlcgp0aGF0IG1heWJlIGl0IHdhc24ndCBEVCdzIGpv
YiB0byB2YWxpZGF0ZSBzb21lIHRoaW5ncy4KCj4gaXNzdWVzIHdlIGZpbmQgd2l0aCBzY2hlbWFz
LiBJdCdzIGZpbmUgdG8gaGF2ZSBzb21lIGNoZWNrcyBpbiB0aGlzCj4gY2FzZSBpZiB0aGUga2Vy
bmVsIGNhbid0IGZ1bmN0aW9uIChvciB1c2UvZW5hYmxlIHRoZSBleHRlbnNpb24pCj4gd2l0aG91
dCB0aGUgZGVwZW5kZW50IGV4dGVuc2lvbnMsIGJ1dCB0aGVyZSBhcmUgbG90cyBvZiBjbGFzc2Vz
IG9mCj4gZXJyb3JzIHRoZSBrZXJuZWwgZG9lc24ndCBuZWVkIHRvIGNhcmUgYWJvdXQuCj4gCj4+
IFRvIG1lLCBDIGNvZGUgaXMgbW9yZSBnZW5lcmFsIGFuZCBtb3JlIHVuaXZlcnNhbGx5IHVuZGVy
c3RhbmRhYmxlCj4+IHRoYW4gWUFNTCBydWxlcywgYnV0IEknbSBiaWFzZWQgYnkgaG93IHdlbGwg
SSB3b3JrIHdpdGggQyB2ZXJzdXMKPj4gWUFNTCBzY2hlbWFzLgo+IAo+IFBlcnNvbmFsbHksIGlm
IEkgd2FzIGdvaW5nIHRvIGRvIHZhbGlkYXRpb24gd2l0aCBjb2RlLCBJIHdvdWxkIHBpY2sKPiBw
eXRob24gb3IgYW55IGxhbmd1YWdlIHRoYXQgY2FuIGhhbmRsZSBsaXN0cyBhbmQgZGljdHMgbmF0
aXZlbHkuIEkgdG9vCj4gd291bGQgcHJlZmVyIEMgZm9yIGV2ZXJ5dGhpbmcsIGJ1dCBpdCdzIG5v
dCB0aGUgYmVzdCB0b29sIGZvciB0aGUgam9iCgpNeSBwb2ludCB3YXMgYWJvdXQgRFQgYmluZGlu
ZyBsb2dpYyB2ZXJzdXMga2VybmVsIGNvZGUgbG9naWMuICBCdXQKeWVzIEkgYWdyZWUgd2l0aCB3
aGF0IHlvdSdyZSBzYXlpbmcgaGVyZS4KCj4gaGVyZS4gRXZlbiBpZiB3ZSBkZWNpZGVkIHRvIGRv
IHZhbGlkYXRpb24gaW4gQyAoSSdtIHByZXR0eSBzdXJlIHdlIGhhZAo+IGEgcHJvcG9zYWwgdG8g
ZG8ganVzdCB0aGF0IGF0IHNvbWUgcG9pbnQpLCB3ZSdkIGp1c3QgZW5kIHVwIGRlZmluaW5nCj4g
b3VyIG93biBkYXRhIHN0cnVjdHVyZXMgb2YgdmFsaWRhdGlvbiBkYXRhLiBCZWNhdXNlIGF0IHRo
ZSBlbmQgb2YgdGhlCj4gZGF5LCBtb3N0IG9mIHRoZSB2YWxpZGF0aW9uIGluZm9ybWF0aW9uIGlz
IGFsbCB0aGUgc2FtZSBzdHJ1Y3R1cmUgb2YKPiBkYXRhIChpLmUuIGEgbGlzdCBvZiBwcm9wZXJ0
aWVzIHdpdGggbGlzdHMgb2YgYWxsb3dlZCB2YWx1ZXMpLiBJJ2QKPiBtdWNoIHJhdGhlciBmb2xs
b3cgc29tZSBzdGFuZGFyZCAoanNvbi1zY2hlbWEpIHRoYXQncyBhbHJlYWR5Cj4gZG9jdW1lbnRl
ZCB0aGFuIHRyeSB0byBjb21lIHVwIHdpdGggbXkgb3duIHBvb3JseSBkb2N1bWVudGVkCj4gaW52
ZW50aW9uLgo+IAo+IEkgZG8gdGhpbmsgdGhlcmUgaXMgc29tZSBuZWVkIGZvciBjb2RlIGJhc2Vk
IHZhbGlkYXRpb24gYXMgdGhlcmUgYXJlCj4gc29tZSB0aGluZ3Mgd2hpY2ggY2FuJ3QgYmUgZXhw
cmVzc2VkIHdpdGggc2NoZW1hcy4gV2UgaGF2ZSBzb21lIG9mCj4gdGhhdCBpbiBkdGMsIGJ1dCB0
aGF0IG9ubHkgd29ya3MgZm9yIGNvcmUgYmluZGluZ3MuIFNvbWUgc29ydCBvZgo+IHB5dGhvbiBz
bmlwcGV0cyBvZiBjb2RlIGluIHNjaGVtYXMgaXMga2luZCBvZiB3aGF0IEknbSB0aGlua2luZy4K
ClRoZSBtYWluIHRoaW5ncyBJIHRha2UgYXdheSBmcm9tIHRoaXMgZGlzY3Vzc2lvbjoKLSBEVCBi
aW5kaW5ncyAqc2hvdWxkKiBlbmNvZGUgY29uc3RyYWludHMgZm9yIFJJU0MtViBleHRlbnNpb25z
CiAgIHRvIGVuZm9yY2UgY2VydGFpbiByZXF1aXJlbWVudHMgZnJvbSB0aGVpciB1bmRlcmx5aW5n
IFJJU0MtVgogICBzcGVjaWZpY2F0aW9ucy4KLSBUaGUgcmVhc29uIHRvIGRvIHRoaXMgaXMgdGhh
dCB0aGUgRFQgdG9vbHMgd2UgaGF2ZSBjYW4gaGVscAogICBlbnN1cmUgY29ycmVjdG5lc3MuICBB
bmQgZG9pbmcgaXQgaW4gdGhlIGJpbmRpbmcgbWVhbnMgaXQgY2FuCiAgIGdldCByZXZpZXdlZCBv
bmNlLCBhbmQgdGhlIGxvZ2ljIHdpbGwgYXBwbHkgdG8gYWxsIERUUyBmaWxlcwogICB0aGF0IGFk
aGVyZSB0byB0aGUgYmluZGluZy4KLSBEb2luZyBzb21lIHZhbGlkYXRpb24gaW4gdGhlIGtlcm5l
bCBpcyBzdGlsbCB1c2VmdWwsIGJ1dCBhbnl0aGluZwogICBkb25lIHRoZXJlIG5lZWRzIHRvIHJl
cGxpY2F0ZWQgaW4gYW55IG90aGVyIGNvZGUgYmFzZXMgdGhhdCBuZWVkCiAgIHRvIHBhcnNlIERU
IGZpbGVzLgotIENvbm9yIG93bnMgdGhpcyBtZXNzLiA6KQoKCQkJCQktQWxleAoKPj4gSW4gYW55
IGNhc2UsIGEgIndyb25nIiBiaW5kaW5nIGlzIGEgcHJvYmxlbSBubyBtYXR0ZXIgd2hhdCB0aGUK
Pj4gcmVhc29uLiAgT25lIHdheSBvciBhbm90aGVyIHRoZXJlIGFyZSB0aGluZ3MgZXhwcmVzc2Vk
IHZpYSBEVAo+PiB0aGF0IG11c3QgbWF0Y2ggdGhlIFJJU0MtViBzcGVjaWZpY2F0aW9ucy4gIEFu
ZCB5ZXMsIHdlIGRvIGhhdmUKPj4gdG9vbHMgYW5kIGJpbmRpbmdzIHRoYXQgY2FuIHZlcmlmeSB0
aGluZ3MgcmVsYXRlZCB0byBEVC4KPj4KPj4+PiBBbmQgbm93LCBoYXZpbmcgbG9va2VkIGF0IHRo
ZXNlIGFkZGVkIGJpbmRpbmcgZGVmaW5pdGlvbnMgKGluIHBhdGNoZXMKPj4+PiAwNyB0aHJvdWdo
IDExIGluIHRoaXMgc2VyaWVzKSwgSSB3b25kZXIgd2hhdCBleGFjdGx5IGlzIHJlcXVpcmVkIGZv
cgo+Pj4+IHRoZW0gdG8gYmUgYWNjZXB0ZWQuICBGb3IgdGhlIG1vc3QgcGFydCB0aGVzZSBzZWVt
IHRvIGp1c3QgYmUgZGVmaW5pbmcKPj4+PiBob3cgdGhlIGV4dGVuc2lvbnMgc3BlY2lmaWVkIGZv
ciBSSVNDLVYgYXJlIHRvIGJlIGV4cHJlc3NlZCBpbgo+Pj4+IERUIGZpbGVzLiAgSXQgc2VlbXMg
dG8gYmUgYSBmYWlybHkgc3RyYWlnaHRmb3J3YXJkIGNvcHkgZnJvbSB0aGUKPj4+PiByYXRpZmll
ZCBzcGVjaWZpY2F0aW9uKHMpIHRvIHRoZSBZQU1MIGZvcm1hdC4KPj4+Pgo+Pj4+IFdobyBuZWVk
IHRvIHNpZ24gb2ZmIG9uIGl0PyAgQ29ub3I/ICBQYXVsPyAgRFQgbWFpbnRhaW5lcnM/Cj4+Pgo+
Pj4gSSBnZW5lcmFsbHkgbGVhdmUgdGhpcyBleHRlbnNpb24gbWVzcyB0byBDb25vci4KPj4KPj4g
U291bmRzIHdpc2UuICBTaG91bGQgSSBhZGRyZXNzIG15IG90aGVyIGZldyBxdWVzdGlvbnMgb24g
dGhpcwo+PiB0b3BpYyB0byBDb25vcj8gIEkgZG9uJ3Qgd2FudCB0aGlzIHBhcnRpY3VsYXIgc2Vy
aWVzIHRvIGdldAo+PiBoZWxkIHVwIG9uIHVucmVsYXRlZCBkaXNjdXNzaW9ucy4KPiAKPiBQcm9i
YWJseSBzby4KPiAKPiBSb2IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
