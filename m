Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91FBCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj6pu2NdGeut8PhiMlgwUxXXYXgx3svArDwrkVMfKf4=; b=t/nDj5U5xGy2efAVnGm7VW0cZe
	iwrX4ftCzeFOtu4YbrXmuKeyMAzUtISvvzGa6rzm+n7GIa8mL+2+SF9BWxGMJs/warQGl5i7y9c9C
	wsDGNBRV3sj57M2hStMxakuK5O5pfFV1uwgBK3njFmP08xhdd/9F13hMil34x50kvqHqcF+yiI0CW
	BTEHAXVf4RPA4O4q8il3XSfmqfBPaZP6Ex5BLm2rtqyDz6k/wRm2nJBSCn8w+VKytHcpMy2hRTvbR
	IRtbwkcaQoliJbH33eRdgk5/+6LA8CTI/mHkvJf7lLaUjpe6yo+3+MzILdeoz4SHrmKuVsuuHsVmV
	xhdVvJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugAO-00000009AAz-2oLt;
	Wed, 10 Apr 2024 22:11:40 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugAL-00000009A9f-1u6g
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 22:11:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ecf1bb7f38so5010257b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 15:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712787095; x=1713391895; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/QiNgJqGWJlDyyUI6HRBW5pQDmQPsVVStIMWqIN9niY=;
        b=hIeRAR/N753mH19253iI/EPrc6/ZRenKuVn86ZWfmrPXV7lDCvtl+jt27q9pudARdP
         T8rSj2ftXBtzpbaM86aCSp2iHErWSMmPyMvrZp98rEbhKxJM+sdAqhT5+6u/DOHMLwF8
         MKS76LJMLLsGzTvxzuB8UoJkFTe98vpzuN2NRwQiZh2A2nL4gQEgrJPBlbRSDiwvkbVO
         fM97mtKG4KOxpY5Ipb3bdXaxrIxrdfS49G43xDVRQxSoJ3sXEqgCe/30ku8g933UFRJz
         86CP7h4yerygiPgYuKDEXCxQBeOO6ss5YO5sGkRlewLTEnoLID6+ZQsLygCGjsGDJIAN
         Fg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712787095; x=1713391895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QiNgJqGWJlDyyUI6HRBW5pQDmQPsVVStIMWqIN9niY=;
        b=wiPm7pSERBf2CEhcWtcxdjwLnVOARU7LgcJ4xtAWO0seW9IQlWk3znTwd4blO/J5u7
         ivWDsgQT6o29w2HU658BKh/oOW4SboEwwhp6AaHuJDyu7CZqZohXFrqr7la1/P66+pxM
         icMxPAO9c/b3mJpnQbmLN7qcOrUa4sEp+Xk3suzW5nNi79IRACLGwFFgiRr50hqYx6rl
         BiWf2Bd4+p7wb72o5GUl73icnfiuFKHG6LlqY/2rOA/YYfWSiLXZPT0aqdZFiIG1L7jc
         9EWhi+nTY/7fJnzAaohLgRoKTnJ+y5yNqp/s6P/5bzxTESqQn1RqqWXJQmZMGtJpEZ9S
         g+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUHS6yynUm00/LCDemMEtD7ZfLyTvTzLxzztC6H9FNgGf1bVdqWEUGguxhLDul/YF04IzPAmi5onysCc/XBHW2AoZQj5GOFQNrVJiBrJdiL
X-Gm-Message-State: AOJu0YxaFn+4lubdvOlmJuuiqAUtNnIVWDT008GLo0DBeeXRZJhjMCLk
	MArcseM1w0ixUCRJACXx4j+VwaOx0vfjs14+GIJrGvnd85KN9G895JD76xpVk/8=
X-Google-Smtp-Source: AGHT+IG/YHAlTiVOH3S4PqA/DOFjKAze10CUA0qLcKk7UmApgTn+NVguvxWt0ZZPHSceedWB6R2kbw==
X-Received: by 2002:a05:6a21:2786:b0:1a9:7e6a:12a1 with SMTP id rn6-20020a056a21278600b001a97e6a12a1mr245273pzb.57.1712787095176;
        Wed, 10 Apr 2024 15:11:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w18-20020a639352000000b005f3c84e12c9sm35672pgm.48.2024.04.10.15.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:11:34 -0700 (PDT)
Date: Wed, 10 Apr 2024 15:11:32 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
Message-ID: <ZhcOlNK4u1xAjcs9@debug.ba.rivosinc.com>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240405-091c6c174f023d74b434059d@orel>
 <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
 <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_151137_506203_B461F53F 
X-CRM114-Status: GOOD (  22.24  )
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

T24gTW9uLCBBcHIgMDgsIDIwMjQgYXQgMTA6MDE6MTJBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+Cj4KPk9uIDA1LzA0LzIwMjQgMTk6MzMsIERlZXBhayBHdXB0YSB3cm90ZToKPj4g
T24gRnJpLCBBcHIgNSwgMjAyNCBhdCA4OjI24oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24gVGh1LCBBcHIgMDQsIDIwMjQgYXQgMTI6
MzI6NDZQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pj4+IFRoZSBaaW1vcCBJU0Eg
ZXh0ZW5zaW9uIHdhcyByYXRpZmllZCByZWNlbnRseS4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0
Cj4+Pj4gZm9yIHBhcnNpbmcgaXQgZnJvbSByaXNjdixpc2EsIGh3cHJvYmUgZXhwb3J0IGFuZCBr
dm0gc3VwcG9ydCBmb3IKPj4+PiBHdWVzdC9WTS4KPj4+Cj4+PiBJJ20gbm90IHN1cmUgd2UgbmVl
ZCB0aGlzLiBaaW1vcCBieSBpdHNlbGYgaXNuJ3QgdXNlZnVsLCBzbyBJIGRvbid0IGtub3cKPj4+
IGlmIHdlIG5lZWQgdG8gYWR2ZXJ0aXNlIGl0IGF0IGFsbC4gV2hlbiBhbiBleHRlbnNpb24gY29t
ZXMgYWxvbmcgdGhhdAo+Pj4gcmVkZWZpbmVzIHNvbWUgTU9QcywgdGhlbiB3ZSdsbCBhZHZlcnRp
c2UgdGhhdCBleHRlbnNpb24sIGJ1dCB0aGUgZmFjdAo+Pj4gWmltb3AgaXMgdXNlZCBmb3IgdGhh
dCBleHRlbnNpb24gaXMgcmVhbGx5IGp1c3QgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsLgo+Pgo+
PiBPbmx5IHNpdHVhdGlvbiBJIHNlZSB0aGlzIGNhbiBiZSB1c2VmdWwgaXMgdGhpczotLQo+Pgo+
PiBBbiBpbXBsZW1lbnRlciwgaW1wbGVtZW50ZWQgWmltb3BzIGluIENQVSBzb2xlbHkgZm9yIHRo
ZSBwdXJwb3NlIHRoYXQgdGhleSBjYW4KPj4gcnVuIG1haW5saW5lIGRpc3RybyAmIHBhY2thZ2Vz
IG9uIHRoZWlyIGhhcmR3YXJlIGFuZCBkb24ndCB3YW50IHRvIGxldmVyYWdlIGFueQo+PiBmZWF0
dXJlIHdoaWNoIGFyZSBidWlsdCBvbiB0b3Agb2YgWmltb3AuCj4KPlllcywgdGhlIHJhdGlvbmFs
ZSB3YXMgdGhhdCBzb21lIGJpbmFyaWVzIHVzaW5nIGV4dGVuc2lvbnMgdGhhdCBvdmVybG9hZAo+
TU9QcyBjb3VsZCBzdGlsbCBiZSBydW4uIFdpdGggWmltb3AgZXhwb3NlZCwgdGhlIGxvYWRlciBj
b3VsZCBkZXRlcm1pbmUKPmlmIHRoZSBiaW5hcnkgY2FuIGJlIGV4ZWN1dGVkIHdpdGhvdXQgcG90
ZW50aWFsbHkgY3Jhc2hpbmcuIFdlIGNvdWxkCj5hbHNvIGxldCB0aGUgcHJvZ3JhbSBydW4gYW55
d2F5IGJ1dCB0aGUgZXhlY3V0aW9uIGNvdWxkIHBvdGVudGlhbGx5Cj5jcmFzaCB1bmV4cGVjdGVk
bHksIHdoaWNoIElNSE8gaXMgbm90IHJlYWxseSBnb29kIGZvciB0aGUgdXNlcgo+ZXhwZXJpZW5j
ZSBub3IgZm9yIGRlYnVnZ2luZy4gSSBhbHJlYWR5IHRoaW5rIHRoYXQgdGhlIHNlZ2ZhdWx0cyB3
aGljaAo+aGFwcGVucyB3aGVuIGV4ZWN1dGluZyBiaW5hcmllcyB0aGF0IG5lZWQgc29tZSBtaXNz
aW5nIGV4dGVuc2lvbiBhcmUgbm90Cj5zbyBlYXN5IHRvIGRlYnVnLCBzbyBiZXR0ZXIgYWRkIG1v
cmUgZ3VhcmRzLgo+Cj4+Cj4+IEFzIGFuIGV4YW1wbGUgemljZmlscCBhbmQgemljZmlzcyBhcmUg
ZGVwZW5kZW50IG9uIHppbW9wcy4gZ2xpYmMgY2FuCj4+IGRvIGZvbGxvd2luZwo+Pgo+PiAxKSBj
aGVjayBlbGYgaGVhZGVyIGlmIGJpbmFyeSB3YXMgY29tcGlsZWQgd2l0aCB6aWNmaXNzIGFuZCB6
aWNmaWxwLAo+PiBpZiB5ZXMgZ290byBzdGVwIDIsIGVsc2UgZ290byBzdGVwIDYuCj4+IDIpIGNo
ZWNrIGlmIHppY2Zpc3MvemljZmlscCBpcyBhdmFpbGFibGUgaW4gaHcgdmlhIGh3cHJvYmUsIGlm
IHllcwo+PiBnb3RvIHN0ZXAgNS4gZWxzZSBnb3RvIHN0ZXAgMwo+PiAzKSBjaGVjayBpZiB6aW1v
cCBpcyBhdmFpbGFibGUgdmlhIGh3cHJvYmUsIGlmIHllcyBnb3RvIHN0ZXAgNiwgZWxzZSBnb3Rv
IHN0ZXAgNAo+Cj5JIHRoaW5rIHlvdSBtZWFudCBzdGVwIDUgcmF0aGVyIHRoYW4gc3RlcCA2LgoK
Tm8gSSBkaWQgbWVhbiBzdGVwIDYgd2hpY2ggaXMgbGV0IHRoZSBiaW5hcnkgcnVuLiBTdGVwIDUg
aXMgImlzc3VlIHRoZSBwcmN0bCIgdG8KbGlnaHQgdXAgdGhlIGZlYXR1cmUsIHRoaXMgc2hvdWxk
IGhhdmUgYmVlbiByZWFjaGVkIHZpYSBzdGVwIDIgaWYgZmVhdHVyZSB3YXMKYXZhaWxhYmxlLgoK
R29pbmcgdG8gc3RlcCA2IGZyb20gc3RlcCAzIGJhc2ljYWxseSBtZWFucyB0aGF0IHVuZGVybHlp
bmcgaGFyZHdhcmUgb25seSBzdXBwb3J0cwp6aW1vcHMgYW5kIHRodXMgdGhpcyBiaW5hcnkgaXMg
c2FmZSB0byBydW4gb24gdGhpcyBoYXJkd2FyZS4gQnV0IG5vIG5lZWQgdG8gaXNzdWUKYW55IHBy
Y3RsIHRvIGtlcm5lbCB0byBlbmFibGUgdGhpcyBmZWF0dXJlLgoKPgo+Q2zDqW1lbnQKPgo+PiA0
KSBUaGlzIGJpbmFyeSB3b24ndCBiZSBhYmxlIHRvIHJ1biBzdWNjZXNzZnVsbHkgb24gdGhpcyBw
bGF0Zm9ybSwKPj4gaXNzdWUgZXhpdCBzeXNjYWxsLiA8LS0gdGVybWluYXRpb24KPj4gNSkgaXNz
dWUgcHJjdGwgdG8gZW5hYmxlIHNoYWRvdyBzdGFjayBhbmQgbGFuZGluZyBwYWQgZm9yIGN1cnJl
bnQgdGFzawo+PiA8LS0gZW5hYmxlIGZlYXR1cmUKPj4gNikgbGV0IHRoZSBiaW5hcnkgcnVuIDwt
LSBsZXQgdGhlIGJpbmFyeSBydW4gYmVjYXVzZSBubyBoYXJtIGNhbiBiZSBkb25lCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
