Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504A9C7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 12:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4uWPI5667X8c3UsY7fpM8BPkM9M+Dvgk0IF8NjQFkE=; b=DyKEH03Omec0Yg
	QxbSvh4V/ChTY5GdyyBI3WJV3zsE2lFUzxp4zgUG3joVjqy4UAUxXMrNqPipTcIdc7LhzKVKnff+/
	qkDmjiAus/ManNAzAcE90tS4gyRuB2jLYq7hNXMUc8nDTwWHP/Io5Xi8GeaSqYG5T0UcmPV2x6/Nj
	XbCeVJo3l1HPHhwKogVg98P3Xp/xQGcHWE45+Kh1S4LMXNaqdGwHYBMLZFClUX3BRANBgJKUiGbRc
	U57GMKe8RQeZkCPx6WSsakm7EJ3AY217o1iEyPhOf156/X5inBv5ucZjnIWjDcMzGBAqK4lVjlauN
	1U6M3lJ7vImBDz5wtaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPB6-00000008cCT-0gF2;
	Wed, 25 Jun 2025 12:24:36 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNhj-00000008Mpq-0bh0;
	Wed, 25 Jun 2025 10:50:12 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so1797475137.1;
        Wed, 25 Jun 2025 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848610; x=1751453410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sJoc+hZXTIC0xZRzuuXvo5VKveaaibtDlPs/XIETRE=;
        b=AjOLgAzzUte4GrQ+Wclc4VzU2uWJCTvANWcqPTGuB6073PzEUYMgm8ilv9TWCU6zaa
         GDAQiWhBcHNy2wKo+qr53X4HhWN6OhbPvs+kqdH33lN85QTOcWsa/4FjKrrkYUm0iRSE
         5Xs5QAg+Vd88Pa9wW4l5uELl3WMOaKGFPLP7Gt7CUrneEY6cgbvbE+2ZEFusi4FgY2KJ
         MypSNPnx0qDwIUlc9/QPb5/kTrid+wSWCcvdAxE0CAoed+xuXAi+u8o138yIpkYug9h7
         9hMaJaKYhYBfWZ41G0LzOKygWJEIIVe6ae4XtNmRa6Oj4BB7eGPQBsaL001Ml5yc+7x8
         knrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848610; x=1751453410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sJoc+hZXTIC0xZRzuuXvo5VKveaaibtDlPs/XIETRE=;
        b=fQrAFACJUatQNt0VNyIBMBKKxhHBtplTfjPRUHFk+T6Zpynv3FWSRNEZaG04JfTwV8
         /MpyrTgSpxsyqeHGOL2oUnSoqoP5tRwQcj4JibA3ndgW0lsIQu8rJnC3UxKuqwIWngQm
         Oich0r+sv+8VZxtzKNHI/JQQ9nCJhqhokYBw4TuSv4q8pxtZWP9FcYpOsUtqkBfxHjqD
         Kvkt33R1wk6DvKCAKIbMz5hGcdwfS37ZHcs3h+B/qSK3f7pY16L5+23+VErImCn/1J5d
         +i7x4jkFDYr7PJVFFAwjeS/ZmhF6vGPWTb6qqS0PfKEd319mgKqnlbe6nYbgNmycY864
         gcWg==
X-Forwarded-Encrypted: i=1; AJvYcCVoHc/gFRKWS544H1xcKEjAtSb1gWTGjawDyJ4jYJPcOIHkcEcFIbtfMJpZYCyFMe20j6lGELtLWjL5qb4a4Bu4@lists.infradead.org, AJvYcCWuVP8nFUiVC2xkF5hvzN65gQlIYIUJqQrzc4aX7+IyBpWeSNzJqPt9uUWJ6JHVUX2QNW3IABy9He/T4OU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyXBuY11SfpY+uSk5jWZbeIIoIuiAmP027Ol4kW+mOF0S0QlOM
	z4wJqPdDrSOZPsxYLVEvsGP5ls38AL0XBI4VCLvLn4/nlDEIhzeNG50FDMsBBDbuDw4z9DWwOO7
	GrN8hAQdiQt2G0/6M8G6ZvDu4IZBmTHY=
X-Gm-Gg: ASbGncviihgxZzKflzPA98z+rXYTtnbs3veWaSyiuwWVgdhxtVPa9F2XglNzSQ0hqMl
	MWm2o9bumJ1ITwbLBuAKYAsW+/86B9T+fLQ6nrqE2gXY8tPlM6+dBhd0XjoJC+TRAwlvkalrrUW
	LlPfPxEzp3A5eQ+gRbBavsNOhW0VyvRV0/y+ESRnrzfpk=
X-Google-Smtp-Source: AGHT+IFIGWbS74JzjCEZUb4i5VKaQ/aFUR/LkXTomtH2wQ2EWDeymwBSyFo8o2yIrCkV5HClVkxBQa8gvmUemUzz4AI=
X-Received: by 2002:a05:6102:4193:b0:4e9:968b:4416 with SMTP id
 ada2fe7eead31-4ecc76a9296mr1213988137.24.1750848609825; Wed, 25 Jun 2025
 03:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com> <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
In-Reply-To: <8a157228-0b7e-479d-a224-ec85b458ea75@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:49:57 +1200
X-Gm-Features: Ac12FXxMNCsiYUkQXXJTm07hkaCKzJuFJqJgjEbwhAVFd_yNyGUFpCyPyMLyoy8
Message-ID: <CAGsJ_4xPEqXozZCy623LzD6Y01cM9XrbrrYAbddXnUj2eZ8O2Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035011_191826_C3BE2D7F 
X-CRM114-Status: GOOD (  26.00  )
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTA6NDPigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiAyNS4wNi4yNSAxMjozOCwgQmFycnkgU29uZyB3
cm90ZToKPiA+Pj4gZGlmZiAtLWdpdCBhL21tL3JtYXAuYyBiL21tL3JtYXAuYwo+ID4+PiBpbmRl
eCBmYjYzZDkyNTZmMDkuLjI0MWQ1NWE5MmE0NyAxMDA2NDQKPiA+Pj4gLS0tIGEvbW0vcm1hcC5j
Cj4gPj4+ICsrKyBiL21tL3JtYXAuYwo+ID4+PiBAQCAtMTg0NywxMiArMTg0NywyNSBAQCB2b2lk
IGZvbGlvX3JlbW92ZV9ybWFwX3B1ZChzdHJ1Y3QgZm9saW8gKmZvbGlvLCBzdHJ1Y3QgcGFnZSAq
cGFnZSwKPiA+Pj4KPiA+Pj4gICAgLyogV2Ugc3VwcG9ydCBiYXRjaCB1bm1hcHBpbmcgb2YgUFRF
cyBmb3IgbGF6eWZyZWUgbGFyZ2UgZm9saW9zICovCj4gPj4+ICAgIHN0YXRpYyBpbmxpbmUgYm9v
bCBjYW5fYmF0Y2hfdW5tYXBfZm9saW9fcHRlcyh1bnNpZ25lZCBsb25nIGFkZHIsCj4gPj4+IC0g
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZm9saW8gKmZvbGlvLCBwdGVfdCAqcHRlcCkKPiA+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZm9s
aW8gKmZvbGlvLCBwdGVfdCAqcHRlcCwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiA+Pj4gICAgewo+
ID4+PiAgICAgICAgY29uc3QgZnBiX3QgZnBiX2ZsYWdzID0gRlBCX0lHTk9SRV9ESVJUWSB8IEZQ
Ql9JR05PUkVfU09GVF9ESVJUWTsKPiA+Pj4gKyAgICAgdW5zaWduZWQgbG9uZyBuZXh0X3BtZCwg
dm1hX2VuZCwgZW5kX2FkZHI7Cj4gPj4+ICAgICAgICBpbnQgbWF4X25yID0gZm9saW9fbnJfcGFn
ZXMoZm9saW8pOwo+ID4+PiAgICAgICAgcHRlX3QgcHRlID0gcHRlcF9nZXQocHRlcCk7Cj4gPj4+
Cj4gPj4+ICsgICAgIC8qCj4gPj4+ICsgICAgICAqIExpbWl0IHRoZSBiYXRjaCBzY2FuIHdpdGhp
biBhIHNpbmdsZSBWTUEgYW5kIHdpdGhpbiBhIHNpbmdsZQo+ID4+PiArICAgICAgKiBwYWdlIHRh
YmxlLgo+ID4+PiArICAgICAgKi8KPiA+Pj4gKyAgICAgdm1hX2VuZCA9IHZtYS0+dm1fZW5kOwo+
ID4+PiArICAgICBuZXh0X3BtZCA9IEFMSUdOKGFkZHIgKyAxLCBQTURfU0laRSk7Cj4gPj4+ICsg
ICAgIGVuZF9hZGRyID0gYWRkciArICh1bnNpZ25lZCBsb25nKW1heF9uciAqIFBBR0VfU0laRTsK
PiA+Pj4gKwo+ID4+PiArICAgICBpZiAoZW5kX2FkZHIgPiBtaW4obmV4dF9wbWQsIHZtYV9lbmQp
KQo+ID4+PiArICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Pgo+ID4+IE1heSBJIHN1Z2dl
c3QgdGhhdCB3ZSBjbGVhbiBhbGwgdGhhdCB1cCBhcyB3ZSBmaXggaXQ/Cj4gPj4KPiA+PiBNYXli
ZSBzb21ldGhpbmcgbGlrZSB0aGlzOgo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL21tL3JtYXAuYyBi
L21tL3JtYXAuYwo+ID4+IGluZGV4IDNiNzRiYjE5YzExZGQuLjExZmJkZGM2YWQ4ZDYgMTAwNjQ0
Cj4gPj4gLS0tIGEvbW0vcm1hcC5jCj4gPj4gKysrIGIvbW0vcm1hcC5jCj4gPj4gQEAgLTE4NDUs
MjMgKzE4NDUsMzggQEAgdm9pZCBmb2xpb19yZW1vdmVfcm1hcF9wdWQoc3RydWN0IGZvbGlvICpm
b2xpbywgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPj4gICAgI2VuZGlmCj4gPj4gICAgfQo+ID4+Cj4g
Pj4gLS8qIFdlIHN1cHBvcnQgYmF0Y2ggdW5tYXBwaW5nIG9mIFBURXMgZm9yIGxhenlmcmVlIGxh
cmdlIGZvbGlvcyAqLwo+ID4+IC1zdGF0aWMgaW5saW5lIGJvb2wgY2FuX2JhdGNoX3VubWFwX2Zv
bGlvX3B0ZXModW5zaWduZWQgbG9uZyBhZGRyLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBmb2xpbyAqZm9saW8sIHB0ZV90ICpwdGVwKQo+ID4+ICtzdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGludCBmb2xpb191bm1hcF9wdGVfYmF0Y2goc3RydWN0IGZvbGlvICpmb2xpbywKPiA+
PiArICAgICAgICAgICAgICAgc3RydWN0IHBhZ2Vfdm1hX21hcHBlZF93YWxrICpwdm13LCBlbnVt
IHR0dV9mbGFncyBmbGFncywKPiA+PiArICAgICAgICAgICAgICAgcHRlX3QgcHRlKQo+ID4+ICAg
IHsKPiA+PiAgICAgICAgICAgY29uc3QgZnBiX3QgZnBiX2ZsYWdzID0gRlBCX0lHTk9SRV9ESVJU
WSB8IEZQQl9JR05PUkVfU09GVF9ESVJUWTsKPiA+PiAtICAgICAgIGludCBtYXhfbnIgPSBmb2xp
b19ucl9wYWdlcyhmb2xpbyk7Cj4gPj4gLSAgICAgICBwdGVfdCBwdGUgPSBwdGVwX2dldChwdGVw
KTsKPiA+PiArICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gcHZtdy0+dm1hOwo+
ID4+ICsgICAgICAgdW5zaWduZWQgbG9uZyBlbmRfYWRkciwgYWRkciA9IHB2bXctPmFkZHJlc3M7
Cj4gPj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbWF4X25yOwo+ID4+ICsKPiA+PiArICAgICAgIGlm
IChmbGFncyAmIFRUVV9IV1BPSVNPTikKPiA+PiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4g
Pj4gKyAgICAgICBpZiAoIWZvbGlvX3Rlc3RfbGFyZ2UoZm9saW8pKQo+ID4+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMTsKPiA+PiArCj4gPj4gKyAgICAgICAvKiBXZSBtYXkgb25seSBiYXRjaCB3
aXRoaW4gYSBzaW5nbGUgVk1BIGFuZCBhIHNpbmdsZSBwYWdlIHRhYmxlLiAqLwo+ID4+ICsgICAg
ICAgZW5kX2FkZHIgPSBtaW5fdCh1bnNpZ25lZCBsb25nLCBBTElHTihhZGRyICsgMSwgUE1EX1NJ
WkUpLCB2bWEtPnZtX2VuZCk7Cj4gPgo+ID4gSXMgdGhpcyBwbWRfYWRkcl9lbmQoKT8KPiA+Cj4K
PiBZZXMsIHRoYXQgY291bGQgYmUgcmV1c2VkIGFzIHdlbGwgaGVyZS4KPgo+ID4+ICsgICAgICAg
bWF4X25yID0gKGVuZF9hZGRyIC0gYWRkcikgPj4gUEFHRV9TSElGVDsKPiA+Pgo+ID4+ICsgICAg
ICAgLyogV2Ugb25seSBzdXBwb3J0IGxhenlmcmVlIGJhdGNoaW5nIGZvciBub3cgLi4uICovCj4g
Pj4gICAgICAgICAgIGlmICghZm9saW9fdGVzdF9hbm9uKGZvbGlvKSB8fCBmb2xpb190ZXN0X3N3
YXBiYWNrZWQoZm9saW8pKQo+ID4+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPj4g
KyAgICAgICAgICAgICAgIHJldHVybiAxOwo+ID4+ICAgICAgICAgICBpZiAocHRlX3VudXNlZChw
dGUpKQo+ID4+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPj4gLSAgICAgICBpZiAo
cHRlX3BmbihwdGUpICE9IGZvbGlvX3Bmbihmb2xpbykpCj4gPj4gLSAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsKPiA+PiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPj4gKyAgICAgICAv
KiAuLi4gd2hlcmUgd2UgbXVzdCBiZSBhYmxlIHRvIGJhdGNoIHRoZSB3aG9sZSBmb2xpby4gKi8K
PiA+PiArICAgICAgIGlmIChwdGVfcGZuKHB0ZSkgIT0gZm9saW9fcGZuKGZvbGlvKSB8fCBtYXhf
bnIgIT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKQo+ID4+ICsgICAgICAgICAgICAgICByZXR1cm4g
MTsKPiA+PiArICAgICAgIG1heF9uciA9IGZvbGlvX3B0ZV9iYXRjaChmb2xpbywgYWRkciwgcHZt
dy0+cHRlLCBwdGUsIG1heF9uciwgZnBiX2ZsYWdzLAo+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE5VTEwsIE5VTEwsIE5VTEwpOwo+ID4+Cj4gPj4gLSAgICAgICByZXR1cm4g
Zm9saW9fcHRlX2JhdGNoKGZvbGlvLCBhZGRyLCBwdGVwLCBwdGUsIG1heF9uciwgZnBiX2ZsYWdz
LCBOVUxMLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCBOVUxMKSA9
PSBtYXhfbnI7Cj4gPj4gKyAgICAgICBpZiAobWF4X25yICE9IGZvbGlvX25yX3BhZ2VzKGZvbGlv
KSkKPiA+PiArICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPj4gKyAgICAgICByZXR1cm4gbWF4
X25yOwo+ID4+ICAgIH0KPiA+Pgo+ID4+ICAgIC8qCj4gPj4gQEAgLTIwMjQsOSArMjAzOSw3IEBA
IHN0YXRpYyBib29sIHRyeV90b191bm1hcF9vbmUoc3RydWN0IGZvbGlvICpmb2xpbywgc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
cHRlX2RpcnR5KHB0ZXZhbCkpCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZvbGlvX21hcmtfZGlydHkoZm9saW8pOwo+ID4+ICAgICAgICAgICAgICAgICAgIH0gZWxzZSBp
ZiAobGlrZWx5KHB0ZV9wcmVzZW50KHB0ZXZhbCkpKSB7Cj4gPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGZvbGlvX3Rlc3RfbGFyZ2UoZm9saW8pICYmICEoZmxhZ3MgJiBUVFVfSFdQT0lT
T04pICYmCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhbl9iYXRjaF91bm1hcF9m
b2xpb19wdGVzKGFkZHJlc3MsIGZvbGlvLCBwdm13LnB0ZSkpCj4gPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBucl9wYWdlcyA9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBucl9wYWdlcyA9IGZvbGlvX3VubWFwX3B0ZV9iYXRjaChm
b2xpbywgJnB2bXcsIGZsYWdzLCBwdGV2YWwpOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW5kX2FkZHIgPSBhZGRyZXNzICsgbnJfcGFnZXMgKiBQQUdFX1NJWkU7Cj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBmbHVzaF9jYWNoZV9yYW5nZSh2bWEsIGFkZHJlc3MsIGVuZF9h
ZGRyKTsKPiA+Pgo+ID4+Cj4gPj4gTm90ZSB0aGF0IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3
aHkgd2UgaGF2ZSB0byBiYXRjaCB0aGUgd2hvbGUgdGhpbmcgb3IgZmFsbGJhY2sgdG8KPiA+PiBp
bmRpdmlkdWFsIHBhZ2VzLiBXaHkgY2FuJ3Qgd2UgcGVyZm9ybSBvdGhlciBiYXRjaGVzIHRoYXQg
c3BhbiBvbmx5IHNvbWUgUFRFcz8gV2hhdCdzIHNwZWNpYWwKPiA+PiBhYm91dCAxIFBURSB2cy4g
MiBQVEVzIHZzLiBhbGwgUFRFcz8KPiA+Pgo+ID4+Cj4gPj4gQ2FuIHNvbWVvbmUgZW5saWdodGVu
IG1lIHdoeSB0aGF0IGlzIHJlcXVpcmVkPwo+ID4KPiA+IEl0J3MgcHJvYmFibHkgbm90IGEgc3Ry
aWN0IHJlcXVpcmVtZW50IOKAlCBJIHRob3VnaHQgY2FzZXMgd2hlcmUgdGhlCj4gPiBjb3VudCBp
cyBncmVhdGVyIHRoYW4gMSBidXQgbGVzcyB0aGFuIG5yX3BhZ2VzIG1pZ2h0IG5vdCBwcm92aWRl
IG11Y2gKPiA+IHByYWN0aWNhbCBiZW5lZml0LCBleGNlcHQgcGVyaGFwcyBpbiB2ZXJ5IHJhcmUg
ZWRnZSBjYXNlcywgc2luY2UKPiA+IG1hZHZfZnJlZSgpIGFscmVhZHkgY2FsbHMgc3BsaXRfZm9s
aW8oKS4KPgo+IE9rYXksIGJ1dCBpdCBtYWtlcyB0aGUgY29kZSBtb3JlIGNvbXBsaWNhdGVkLiBJ
ZiB0aGVyZSBpcyBubyByZWFzb24gdG8KPiBwcmV2ZW50IHRoZSBiYXRjaGluZywgd2Ugc2hvdWxk
IGRyb3AgaXQuCgpJdCdzIG5vdCBuZWNlc3NhcmlseSBtb3JlIGNvbXBsZXgsIHNpbmNlIHBhZ2Vf
dm1hX21hcHBlZF93YWxrKCkgc3RpbGwKaGFzIHRvIGNoZWNrIGVhY2ggUFRFIGluZGl2aWR1YWxs
eSBhbmQgY2FuJ3Qgc2tpcCBhaGVhZCBiYXNlZCBvbiBuci4KV2l0aCBucl9wYWdlcyBiYXRjaGVk
LCB3ZSBjYW4gZXhpdCB0aGUgbG9vcCBlYXJseSBpbiBvbmUgZ28uCgpUaGFua3MKQmFycnkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
