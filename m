Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2A0C7EE39
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 06:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLXjsq2mpmfsK+D27h2KJzf4ZSaF8a9ELK0VZ2Itx60=; b=WNy2FAePavkuSg
	B91CHIt4tD0fVpeqGDnZFcVWqsxrAcI1rq5UAKIrCBdXR/L5pkdgrKrb7utqBLLy1/jxxaOF0ZJS8
	mAFdfGm5Fk7QyDZR3pYWCB3vZrWop1y2H6mHBB33s2BFFrNDbF0q/iaQRaN6opc9aeWGpF3JwZbVK
	y+1jHm7kEj53dkBDP0gN4JkkX6X3nViuZIlVj+PPtIJGF7N0pZgzlkCJOz718QJ47zbONxSbgyTvw
	wihuo3u3xjhOtrMMAAJQWCvkoCzPg6rclKuQaL6OnAQhTL/EwEyn1Id+IW3ViYXAGhIRXcQwpSJt2
	DMrIvYquAsW2wy6lsA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2zX-0000000DkKk-1mvx;
	Fri, 27 Jun 2025 06:55:19 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2xD-0000000Dk1R-3oOA;
	Fri, 27 Jun 2025 06:52:57 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so1117697241.2;
        Thu, 26 Jun 2025 23:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751007175; x=1751611975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaFMQmISe8mwMKslzDhJXe2N9mtx8GidIaMXPAK04mQ=;
        b=kK1zPewaO1O8M1U6dygDlhpaE43Ax1pE0VtqefjIII+iLOAlpovykC/IiXFBusoIYf
         RWNCKkU78cN2HxUDHtjys/UEfs8HVvAGl3A9QOlnTbuTDOO2VHwshdJxcKZ9JgaUs6Fo
         lC6R2bwiV+zpDDkFlgAKjfkmrwX5Lj0wG8Zy0SJx+1moNC1+c93mN0R4rGj2rVf6YIwg
         b1hwft3GvufeqywJat6dQm/tyTN3M0+SGgV0zMOgPWiGyg5JwU5Lb55wH4FdajSA+XRg
         RvlNwDGoZQjcSSxFssLHe/Q+AIJDqHHc8jVaJOTpRG7+MwcOFwDg/gKBLMiPQmKVeHGv
         xbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751007175; x=1751611975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaFMQmISe8mwMKslzDhJXe2N9mtx8GidIaMXPAK04mQ=;
        b=MUj8iQrTeDycewxXhRQ1Ar1m87V3nYXC/yWBXwPTaD1qOKEvYnO4chCNiIreqbK+vY
         Y8LWHYP8zQBJAwTxfhCvD2jPTrcWd+OvRHcYCBsdtkPZdTrwUP46DG0wiurAp41b0Av9
         pOvpwzT7kwtblNZfgJOhdIKELT25Q1U5FjNuA6vHrzYegn/5FTRymcaXEDwT0vD/5ylq
         4kyd5VaYmP6AJlQ/PaZBAV/bMmlh0EjLnBAgTolVYLQFtqVLDhm0K+VlS9XbWjQ1MxMg
         HJnT/mpdruV2nPOg6TlwHV5ayxzzXMXI3/iHrWuqIdsypQeJdis0exCbF94Yc7f7euiD
         QuQg==
X-Forwarded-Encrypted: i=1; AJvYcCWO6Cjrwsoa+6O9Rd1hKTtSF+P0rc+v0OqB4JJoUlKoRSNxSrXJ3pC3ujY6PsWizcWhQV9vb6SUJ/ggy+Q=@lists.infradead.org, AJvYcCXuqUEhSxJ2uDH7rSXq1R0HsDHbThEg0FXyHllPRnSoLBZ3x7a/RK8UMGrONM6Jf3GGqxXSYN5IzjRKcmAF6jls@lists.infradead.org
X-Gm-Message-State: AOJu0YzOh9EqP/XNpbLpOsrfOmxqobjPnaIJI9DgpX0lKG1RQdoNlpDW
	I4Vn2UKJ7voD3PUJf774+z/V5i6OVL9esvCRFhpsihEh6W9hRYy8B6nYug7LlLVpWKY2h7FKdR0
	FjCJEuwrl0dHFEHfDBOnMH4fonsF3UD0=
X-Gm-Gg: ASbGncuhlwM3RgWy2SEXHFlgxMVhNak5ni+KKkxuQZ/k6kWE6nCQgIB6zkRkuQKPHOL
	p9cSXBYO9HAsXsR7LVJQwVno5xAREF4lWkfbEbsLu4xOCOngczyPgCzv+2eDNCDR8Yklvl75rKZ
	Gfhyx/eH8g4Xt9Az0fHNVGWC+dK2l610ObhAoMwyUVqyw=
X-Google-Smtp-Source: AGHT+IH6bDiCYOYL1uwyhCR37thkVbMFzWqTF1MJ7TonqI/9c72618WAPYRenRHgD5d7gIqLvS+7c3Y3eFAsHo5tk2Q=
X-Received: by 2002:a05:6102:50a8:b0:4e5:9138:29ab with SMTP id
 ada2fe7eead31-4ee4f6f7c8fmr1635839137.15.1751007174693; Thu, 26 Jun 2025
 23:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250627062319.84936-1-lance.yang@linux.dev>
In-Reply-To: <20250627062319.84936-1-lance.yang@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 18:52:43 +1200
X-Gm-Features: Ac12FXzKrRSpHCQX4R2-HXu3dI84IogjSfBJMN0ktRq8apwqIcoJ13xTkDhUr9k
Message-ID: <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, stable@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_235255_944372_A8A5C2FC 
X-CRM114-Status: GOOD (  14.77  )
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

T24gRnJpLCBKdW4gMjcsIDIwMjUgYXQgNjoyM+KAr1BNIExhbmNlIFlhbmcgPGlvd29ya2VyMEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogTGFuY2UgWWFuZyA8bGFuY2UueWFuZ0BsaW51eC5k
ZXY+Cj4KPiBBcyBwb2ludGVkIG91dCBieSBEYXZpZFsxXSwgdGhlIGJhdGNoZWQgdW5tYXAgbG9n
aWMgaW4gdHJ5X3RvX3VubWFwX29uZSgpCj4gY2FuIHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRF
IHRhYmxlIGlmIGEgbGFyZ2UgZm9saW8gaXMgbWFwcGVkIHN0YXJ0aW5nIGF0Cj4gdGhlIGxhc3Qg
ZW50cnkgb2YgdGhhdCB0YWJsZS4gSXQgd291bGQgYmUgcXVpdGUgcmFyZSBpbiBwcmFjdGljZSwg
YXMKPiBNQURWX0ZSRUUgdHlwaWNhbGx5IHNwbGl0cyB0aGUgbGFyZ2UgZm9saW8gOykKPgo+IFNv
IGxldCdzIGZpeCB0aGUgcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgcmVhZCBieSByZWZhY3Rvcmlu
ZyB0aGUgbG9naWMgaW50bwo+IGEgbmV3IGhlbHBlciwgZm9saW9fdW5tYXBfcHRlX2JhdGNoKCku
Cj4KPiBUaGUgbmV3IGhlbHBlciBub3cgY29ycmVjdGx5IGNhbGN1bGF0ZXMgdGhlIHNhZmUgbnVt
YmVyIG9mIHBhZ2VzIHRvIHNjYW4gYnkKPiBsaW1pdGluZyB0aGUgb3BlcmF0aW9uIHRvIHRoZSBi
b3VuZGFyaWVzIG9mIHRoZSBjdXJyZW50IFZNQSBhbmQgdGhlIFBURQo+IHRhYmxlLgo+Cj4gSW4g
YWRkaXRpb24sIHRoZSAiYWxsLW9yLW5vdGhpbmciIGJhdGNoaW5nIHJlc3RyaWN0aW9uIGlzIHJl
bW92ZWQgdG8KPiBzdXBwb3J0IHBhcnRpYWwgYmF0Y2hlcy4gVGhlIHJlZmVyZW5jZSBjb3VudGlu
ZyBpcyBhbHNvIGNsZWFuZWQgdXAgdG8gdXNlCj4gZm9saW9fcHV0X3JlZnMoKS4KPgo+IFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9hNjk0Mzk4Yy05ZjAzLTQ3MzctODFiOS03
ZTQ5Yzg1N2ZjYmVAcmVkaGF0LmNvbQo+CgpXaGF0IGFib3V0ID8KCkFzIHBvaW50ZWQgb3V0IGJ5
IERhdmlkWzFdLCB0aGUgYmF0Y2hlZCB1bm1hcCBsb2dpYyBpbiB0cnlfdG9fdW5tYXBfb25lKCkK
bWF5IHJlYWQgcGFzdCB0aGUgZW5kIG9mIGEgUFRFIHRhYmxlIHdoZW4gYSBsYXJnZSBmb2xpbyBz
cGFucyBhY3Jvc3MgdHdvIFBNRHMsCnBhcnRpY3VsYXJseSBhZnRlciBiZWluZyByZW1hcHBlZCB3
aXRoIG1yZW1hcCgpLiBUaGlzIHBhdGNoIGZpeGVzIHRoZQpwb3RlbnRpYWwgb3V0LW9mLWJvdW5k
cyBhY2Nlc3MgYnkgY2FwcGluZyB0aGUgYmF0Y2ggYXQgdm1fZW5kIGFuZCB0aGUgUE1ECmJvdW5k
YXJ5LgoKSXQgYWxzbyByZWZhY3RvcnMgdGhlIGxvZ2ljIGludG8gYSBuZXcgaGVscGVyLCBmb2xp
b191bm1hcF9wdGVfYmF0Y2goKSwKd2hpY2ggc3VwcG9ydHMgYmF0Y2hpbmcgYmV0d2VlbiAxIGFu
ZCBmb2xpb19ucl9wYWdlcy4gVGhpcyBpbXByb3ZlcyBjb2RlCmNsYXJpdHkuIE5vdGUgdGhhdCBz
dWNoIGNhc2VzIGFyZSByYXJlIGluIHByYWN0aWNlLCBhcyBNQURWX0ZSRUUgdHlwaWNhbGx5CnNw
bGl0cyBsYXJnZSBmb2xpb3MuCgpUaGFua3MKQmFycnkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
