Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F96C7EE30
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FB3dj+4if0kd8I5OZBf0z4d+xbs1fzKc8VAV29PJLQI=; b=TpcfuXX0KnjphW
	sc+LHfC4TsbKkY93IDaVB1kEljGnNctgzLa6+5t15/DAeyoz5tSuc2mqfTLO1I6+x/59YNsXfQGEu
	UfWnE9XFXtkmGjOB0xJolJHyjPRc48hHl/qwl+q2+GSnFUa89vlk1UQpPtOPtjdxpKTqap19rLlK3
	K0fEaPLn4fWz425OQVhYFddqTfZ1HhjG7aiTUjswMLzg/X9+vBJR3XCE6pMiZ1NDPznDZMn9kMP1Y
	anws3hEhMsA0o2zZlM+/2iaSMmsJ6kZShpVWdGywFAjgnlJo07hsAj7p5tqXKNcTdUOafMgm9sQAZ
	0KtmPrbKbyTga69mdKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPdP-00000008h3c-0LnV;
	Wed, 25 Jun 2025 12:53:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNXB-00000008L20-1S98;
	Wed, 25 Jun 2025 10:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=; b=Y7HbrUHQ/w3i5GNtNNSgLAvog4
	3Nn7K2ttBOJAWkjCn0uZGNcwurmG2ehSGM6MVI83dcK6a9XYUKIRWLviR3eSeWMPRgY6Riieo1C9u
	1FnPrHwXjGxG1iG1jKimR+uIv07FBa39X+9dbxgxN2zGSA8vHbgHTXxNKjQ9OpA6BB1U/5Oq+dnqT
	ASTW76AR+90LkV+HI4dDNG3orWFbxBDqittzYj923lDYutoBxnR34asXz+iO3A4wCYlV+di03lg+h
	4OO3GZNw05GxzTYoZze0foVzFSyitgh46ihvK4yj84rZ0uz4+yDUJen7SDFmBXTfWp3leU4KHK7hG
	XH92J97A==;
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNX7-00000005n6Y-1VJ7;
	Wed, 25 Jun 2025 10:39:16 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4e9a7b4a412so5172240137.0;
        Wed, 25 Jun 2025 03:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750847950; x=1751452750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=;
        b=VEK8yReSzRfjclJ+CmltpwdfN014pVBEmWYgYJ8pCL/Wuz3VrrDVIoDeAm6YSf6yAb
         nbA/1fZhxUs86DXX4XqZigZ76EeP2GCa2Jk0+yMLwvVVdoF6YsQWE4Cx8c1mYeNH1P1e
         ucC/SHSw+Cb57qVGyLeYtZO+zkHnZ7GnJHkF5p4DTvJ6fKD0s6ojwD9cZis7TwD8E4Nr
         nTHAxF6EoVei+fXLrIf9Ll8QClokj/zyquerhd4pmqkAT40i1PRwCqNgz9tsuk3ZGjNL
         IYWnvgZa35fCc6HKuOuZSKNivK1TXpRGQIdf7zwG9y120qgACH5RkXxelKpT4dEyjt7w
         c/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847950; x=1751452750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlzXXksC6vXcwEWp4Ubz93RuG+XsbFoLo1oGd730hiA=;
        b=ocVeqmWVG68NkPqpMVAve89OR9K5MtXW+XE6ARHnnuZegUbHvkm/StOXxbgMDO+dJb
         Ar1OgC8NSWS8Y32S7ZXnPUj0rvlJu3/Nz1BIsrD0Jw3IodmR6JLyvOVFUJjlwiZ7LgsT
         r8LcckFGkJBmxDpW3i/3vYT+UvD+Rmt+FUOTbJ0zCQKeGk8iko5HcbXa2rTFtuHA8dI9
         gWE8X6Hw/vBPqBnezasWQqpC81vutnMTE1Qpdx5hRkKQizyQMJSDJ7ZG3RjMvWN5Obxd
         x02fbw1xL90VsWP6PTZJJ0yeEWeNKMwSgeIgbTV6OQlqwFgw5ZzZlHhkq7/zKN3rmAxU
         LhFg==
X-Forwarded-Encrypted: i=1; AJvYcCVjDABgm4zjKjEU7/BZhQcCAR37THNqK7shfHUH8MbafH8cnXrAJ0FYuTehE4BfMFzbBhaKiDHaNUvfmx8=@lists.infradead.org, AJvYcCXkFJobEiA7+IJvBNvzXQ489HIPrdhoZ4nAuc3feL9l1xDPKjF3be/OwX2SaWvB04SKeFuY/+1nKtWIiKphSzI9@lists.infradead.org
X-Gm-Message-State: AOJu0YzuP2Eo546f/i0nqbGy5891IPSbf3AkZc7EmPhDGySui4I4mM1y
	DjZvs24YB7mTZxmF1tztGZoVjHL8UYENpNw0WK7AjqfvsBSw5nvSwpEpVubHVTPkpNmhvveu20e
	HWOtbQ2NbJ/BH1VHpIC3l9hwqb9UHJI4=
X-Gm-Gg: ASbGncugI3QwxSiqEAOoKZXdYnC+EVj9PSa3HGBHu4MVn9K6uzoVkuKEXDvKUH8xPA6
	7w70KClMGqR46Gj8C9+EqP/PHPaDjxXLGf6UARDphQgQGZloL2qEwjDT8U9lEdoXzl4CrYi5Weq
	9ZECH+nuJH9bmcsT3PqGhqMyHnj7GxexC/kQ6e9JjvDxT5kGKENpbAOQ==
X-Google-Smtp-Source: AGHT+IG24obpqrnDUZOrsCnGBhTMkO5P7QnbH3Bpi0PqgrwKSJcAQukZsZf78Wd+0Bu3XZMIHzdxuYrYGefspIVUODE=
X-Received: by 2002:a05:6102:5107:b0:4e6:df73:f147 with SMTP id
 ada2fe7eead31-4ecc6a7a5e2mr1211118137.11.1750847949712; Wed, 25 Jun 2025
 03:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
In-Reply-To: <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:38:57 +1200
X-Gm-Features: Ac12FXxBwpebbLn5QzN4mzU9-3AOYto8c1Frvun91yLq31aKsLs2IVptkEujUM4
Message-ID: <CAGsJ_4wyByWJqzsDGhx=4=Xs+3uUZt6PZdyVoUCUMAo350cm-g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250625_113913_445386_EC1B1F65 
X-CRM114-Status: GOOD (  24.39  )
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

PiA+IGRpZmYgLS1naXQgYS9tbS9ybWFwLmMgYi9tbS9ybWFwLmMKPiA+IGluZGV4IGZiNjNkOTI1
NmYwOS4uMjQxZDU1YTkyYTQ3IDEwMDY0NAo+ID4gLS0tIGEvbW0vcm1hcC5jCj4gPiArKysgYi9t
bS9ybWFwLmMKPiA+IEBAIC0xODQ3LDEyICsxODQ3LDI1IEBAIHZvaWQgZm9saW9fcmVtb3ZlX3Jt
YXBfcHVkKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCBwYWdlICpwYWdlLAo+ID4KPiA+ICAg
LyogV2Ugc3VwcG9ydCBiYXRjaCB1bm1hcHBpbmcgb2YgUFRFcyBmb3IgbGF6eWZyZWUgbGFyZ2Ug
Zm9saW9zICovCj4gPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBjYW5fYmF0Y2hfdW5tYXBfZm9saW9f
cHRlcyh1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGZvbGlvICpmb2xpbywgcHRlX3QgKnB0ZXApCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBmb2xpbyAqZm9saW8sIHB0ZV90ICpwdGVwLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKPiA+ICAgewo+ID4gICAgICAgY29uc3QgZnBiX3QgZnBiX2ZsYWdzID0g
RlBCX0lHTk9SRV9ESVJUWSB8IEZQQl9JR05PUkVfU09GVF9ESVJUWTsKPiA+ICsgICAgIHVuc2ln
bmVkIGxvbmcgbmV4dF9wbWQsIHZtYV9lbmQsIGVuZF9hZGRyOwo+ID4gICAgICAgaW50IG1heF9u
ciA9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsKPiA+ICAgICAgIHB0ZV90IHB0ZSA9IHB0ZXBfZ2V0
KHB0ZXApOwo+ID4KPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBMaW1pdCB0aGUgYmF0Y2ggc2Nh
biB3aXRoaW4gYSBzaW5nbGUgVk1BIGFuZCB3aXRoaW4gYSBzaW5nbGUKPiA+ICsgICAgICAqIHBh
Z2UgdGFibGUuCj4gPiArICAgICAgKi8KPiA+ICsgICAgIHZtYV9lbmQgPSB2bWEtPnZtX2VuZDsK
PiA+ICsgICAgIG5leHRfcG1kID0gQUxJR04oYWRkciArIDEsIFBNRF9TSVpFKTsKPiA+ICsgICAg
IGVuZF9hZGRyID0gYWRkciArICh1bnNpZ25lZCBsb25nKW1heF9uciAqIFBBR0VfU0laRTsKPiA+
ICsKPiA+ICsgICAgIGlmIChlbmRfYWRkciA+IG1pbihuZXh0X3BtZCwgdm1hX2VuZCkpCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPgo+IE1heSBJIHN1Z2dlc3QgdGhhdCB3ZSBjbGVh
biBhbGwgdGhhdCB1cCBhcyB3ZSBmaXggaXQ/Cj4KPiBNYXliZSBzb21ldGhpbmcgbGlrZSB0aGlz
Ogo+Cj4gZGlmZiAtLWdpdCBhL21tL3JtYXAuYyBiL21tL3JtYXAuYwo+IGluZGV4IDNiNzRiYjE5
YzExZGQuLjExZmJkZGM2YWQ4ZDYgMTAwNjQ0Cj4gLS0tIGEvbW0vcm1hcC5jCj4gKysrIGIvbW0v
cm1hcC5jCj4gQEAgLTE4NDUsMjMgKzE4NDUsMzggQEAgdm9pZCBmb2xpb19yZW1vdmVfcm1hcF9w
dWQoc3RydWN0IGZvbGlvICpmb2xpbywgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAjZW5kaWYKPiAg
IH0KPgo+IC0vKiBXZSBzdXBwb3J0IGJhdGNoIHVubWFwcGluZyBvZiBQVEVzIGZvciBsYXp5ZnJl
ZSBsYXJnZSBmb2xpb3MgKi8KPiAtc3RhdGljIGlubGluZSBib29sIGNhbl9iYXRjaF91bm1hcF9m
b2xpb19wdGVzKHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZm9saW8gKmZvbGlvLCBwdGVfdCAqcHRlcCkKPiArc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBpbnQgZm9saW9fdW5tYXBfcHRlX2JhdGNoKHN0cnVjdCBmb2xpbyAqZm9saW8sCj4gKyAgICAg
ICAgICAgICAgIHN0cnVjdCBwYWdlX3ZtYV9tYXBwZWRfd2FsayAqcHZtdywgZW51bSB0dHVfZmxh
Z3MgZmxhZ3MsCj4gKyAgICAgICAgICAgICAgIHB0ZV90IHB0ZSkKPiAgIHsKPiAgICAgICAgICBj
b25zdCBmcGJfdCBmcGJfZmxhZ3MgPSBGUEJfSUdOT1JFX0RJUlRZIHwgRlBCX0lHTk9SRV9TT0ZU
X0RJUlRZOwo+IC0gICAgICAgaW50IG1heF9uciA9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsKPiAt
ICAgICAgIHB0ZV90IHB0ZSA9IHB0ZXBfZ2V0KHB0ZXApOwo+ICsgICAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEgPSBwdm13LT52bWE7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGVuZF9h
ZGRyLCBhZGRyID0gcHZtdy0+YWRkcmVzczsKPiArICAgICAgIHVuc2lnbmVkIGludCBtYXhfbnI7
Cj4gKwo+ICsgICAgICAgaWYgKGZsYWdzICYgVFRVX0hXUE9JU09OKQo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gMTsKPiArICAgICAgIGlmICghZm9saW9fdGVzdF9sYXJnZShmb2xpbykpCj4gKyAg
ICAgICAgICAgICAgIHJldHVybiAxOwo+ICsKPiArICAgICAgIC8qIFdlIG1heSBvbmx5IGJhdGNo
IHdpdGhpbiBhIHNpbmdsZSBWTUEgYW5kIGEgc2luZ2xlIHBhZ2UgdGFibGUuICovCj4gKyAgICAg
ICBlbmRfYWRkciA9IG1pbl90KHVuc2lnbmVkIGxvbmcsIEFMSUdOKGFkZHIgKyAxLCBQTURfU0la
RSksIHZtYS0+dm1fZW5kKTsKCklzIHRoaXMgcG1kX2FkZHJfZW5kKCk/Cgo+ICsgICAgICAgbWF4
X25yID0gKGVuZF9hZGRyIC0gYWRkcikgPj4gUEFHRV9TSElGVDsKPgo+ICsgICAgICAgLyogV2Ug
b25seSBzdXBwb3J0IGxhenlmcmVlIGJhdGNoaW5nIGZvciBub3cgLi4uICovCj4gICAgICAgICAg
aWYgKCFmb2xpb190ZXN0X2Fub24oZm9saW8pIHx8IGZvbGlvX3Rlc3Rfc3dhcGJhY2tlZChmb2xp
bykpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAgICAgICAgICAgICAgcmV0
dXJuIDE7Cj4gICAgICAgICAgaWYgKHB0ZV91bnVzZWQocHRlKSkKPiAtICAgICAgICAgICAgICAg
cmV0dXJuIGZhbHNlOwo+IC0gICAgICAgaWYgKHB0ZV9wZm4ocHRlKSAhPSBmb2xpb19wZm4oZm9s
aW8pKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAxOwo+ICsgICAgICAgLyogLi4uIHdoZXJlIHdlIG11c3QgYmUgYWJsZSB0byBiYXRjaCB0
aGUgd2hvbGUgZm9saW8uICovCj4gKyAgICAgICBpZiAocHRlX3BmbihwdGUpICE9IGZvbGlvX3Bm
bihmb2xpbykgfHwgbWF4X25yICE9IGZvbGlvX25yX3BhZ2VzKGZvbGlvKSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIDE7Cj4gKyAgICAgICBtYXhfbnIgPSBmb2xpb19wdGVfYmF0Y2goZm9saW8s
IGFkZHIsIHB2bXctPnB0ZSwgcHRlLCBtYXhfbnIsIGZwYl9mbGFncywKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBOVUxMLCBOVUxMLCBOVUxMKTsKPgo+IC0gICAgICAgcmV0dXJu
IGZvbGlvX3B0ZV9iYXRjaChmb2xpbywgYWRkciwgcHRlcCwgcHRlLCBtYXhfbnIsIGZwYl9mbGFn
cywgTlVMTCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgTlVMTCkgPT0g
bWF4X25yOwo+ICsgICAgICAgaWYgKG1heF9uciAhPSBmb2xpb19ucl9wYWdlcyhmb2xpbykpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAxOwo+ICsgICAgICAgcmV0dXJuIG1heF9ucjsKPiAgIH0K
Pgo+ICAgLyoKPiBAQCAtMjAyNCw5ICsyMDM5LDcgQEAgc3RhdGljIGJvb2wgdHJ5X3RvX3VubWFw
X29uZShzdHJ1Y3QgZm9saW8gKmZvbGlvLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHB0ZV9kaXJ0eShwdGV2YWwpKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZvbGlvX21hcmtfZGlydHkoZm9saW8pOwo+ICAgICAg
ICAgICAgICAgICAgfSBlbHNlIGlmIChsaWtlbHkocHRlX3ByZXNlbnQocHRldmFsKSkpIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoZm9saW9fdGVzdF9sYXJnZShmb2xpbykgJiYgIShm
bGFncyAmIFRUVV9IV1BPSVNPTikgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgY2Fu
X2JhdGNoX3VubWFwX2ZvbGlvX3B0ZXMoYWRkcmVzcywgZm9saW8sIHB2bXcucHRlKSkKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX3BhZ2VzID0gZm9saW9fbnJfcGFnZXMoZm9s
aW8pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5yX3BhZ2VzID0gZm9saW9fdW5tYXBfcHRl
X2JhdGNoKGZvbGlvLCAmcHZtdywgZmxhZ3MsIHB0ZXZhbCk7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIGVuZF9hZGRyID0gYWRkcmVzcyArIG5yX3BhZ2VzICogUEFHRV9TSVpFOwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICBmbHVzaF9jYWNoZV9yYW5nZSh2bWEsIGFkZHJlc3MsIGVuZF9h
ZGRyKTsKPgo+Cj4gTm90ZSB0aGF0IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aHkgd2UgaGF2
ZSB0byBiYXRjaCB0aGUgd2hvbGUgdGhpbmcgb3IgZmFsbGJhY2sgdG8KPiBpbmRpdmlkdWFsIHBh
Z2VzLiBXaHkgY2FuJ3Qgd2UgcGVyZm9ybSBvdGhlciBiYXRjaGVzIHRoYXQgc3BhbiBvbmx5IHNv
bWUgUFRFcz8gV2hhdCdzIHNwZWNpYWwKPiBhYm91dCAxIFBURSB2cy4gMiBQVEVzIHZzLiBhbGwg
UFRFcz8KPgo+Cj4gQ2FuIHNvbWVvbmUgZW5saWdodGVuIG1lIHdoeSB0aGF0IGlzIHJlcXVpcmVk
PwoKSXQncyBwcm9iYWJseSBub3QgYSBzdHJpY3QgcmVxdWlyZW1lbnQg4oCUIEkgdGhvdWdodCBj
YXNlcyB3aGVyZSB0aGUKY291bnQgaXMgZ3JlYXRlciB0aGFuIDEgYnV0IGxlc3MgdGhhbiBucl9w
YWdlcyBtaWdodCBub3QgcHJvdmlkZSBtdWNoCnByYWN0aWNhbCBiZW5lZml0LCBleGNlcHQgcGVy
aGFwcyBpbiB2ZXJ5IHJhcmUgZWRnZSBjYXNlcywgc2luY2UKbWFkdl9mcmVlKCkgYWxyZWFkeSBj
YWxscyBzcGxpdF9mb2xpbygpLgoKaWYgKGZvbGlvX3Rlc3RfbGFyZ2UoZm9saW8pKSB7CiAgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgYW55X3lvdW5nLCBhbnlfZGlydHk7CiAgICAgICAgICAg
ICAgICAgICAgICAgIG5yID0gbWFkdmlzZV9mb2xpb19wdGVfYmF0Y2goYWRkciwgZW5kLCBmb2xp
bywgcHRlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHB0ZW50LAomYW55X3lvdW5nLCAmYW55X2RpcnR5KTsKCgogICAgICAgICAgICAgICAgICAg
ICAgICBpZiAobnIgPCBmb2xpb19ucl9wYWdlcyhmb2xpbykpIHsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAuLi4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBz
cGxpdF9mb2xpbyhmb2xpbyk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uCiAg
ICAgICAgICAgICAgICAgICAgICAgfQp9CgpBbm90aGVyIHJlYXNvbiBpcyB0aGF0IHdoZW4gd2Ug
ZXh0ZW5kIHRoaXMgdG8gbm9uLWxhenlmcmVlIGFub255bW91cwpmb2xpb3MgWzFdLCB0aGluZ3Mg
Z2V0IGNvbXBsaWNhdGVkOiBjaGVja2luZyBhbm9uX2V4Y2x1c2l2ZSBhbmQgdXBkYXRpbmcKZm9s
aW9fdHJ5X3NoYXJlX2Fub25fcm1hcF9wdGUgd2l0aCB0aGUgbnVtYmVyIG9mIFBURXMgYmVjb21l
cyB0cmlja3kgaWYKYSBmb2xpbyBpcyBwYXJ0aWFsbHkgZXhjbHVzaXZlIGFuZCBwYXJ0aWFsbHkg
c2hhcmVkLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMjUwNTEzMDg0
NjIwLjU4MjMxLTEtMjFjbmJhb0BnbWFpbC5jb20vCgo+Cj4gLS0KPiBDaGVlcnMsCj4KPiBEYXZp
ZCAvIGRoaWxkZW5iCj4KClRoYW5rcwpCYXJyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
