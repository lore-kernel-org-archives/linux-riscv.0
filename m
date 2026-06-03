Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB69CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsjqDDm3COiXpHIYU6miZdBWQAacl32KXPQHbbdmjtU=; b=ImbwrBN2SPdB4P
	/IvaY9NBCPeYGwggaiVhJh0utp6WRjTI9PSf6nZdEbuGBnSTDp+mqFulMMKA9VwBBm0fuT63mglt2
	oBuvwXYiG3IgoKBJB5kvezjOtvBaM7JNiCT6FJjAKDFqC6Q5YEmshr59bzL1mwoeM5+7NF/jpnJpD
	/Q6wLAI6v1uEFmnFVO0FKG4L4DSfdW7LQCYsKqqwpr3lmW/tKZFfO9x2URapA+HnKsABb8mK4H8gD
	dXkOx7cDXbdkmyebtZKd35aRoGpq/Octkd8nDPZXABDLU9d2X/4VIUR+cUn1VjvMbDyYbVlRLJFgN
	9CgaUtXV2o6R/+edXj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoT-0000000EYod-1Xge;
	Wed, 03 Jun 2026 08:18:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoS-0000000EYoH-00ea
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=; b=NHO/CvNYAvTqgJVQLyPggwGjVJ
	XuxCVMN5UsKjuJ5mrwlWugJkmZuFJumWPRjnXsWKnUeU7nsmlmEU4bocUcPz2SgAQf8J+T6QQzg3y
	kmcsqhNGfti6KXAQJ9o8Hs5Rp3iBKoUeHwgGnL9r6Beiot8VVuy9thD/O9SY4AYlHft/lE0bEv31+
	acFMBNyW1CUcej7Y6vhGlfrXA/AujLiKR9fsEwakjFESoUWAxpF9DyrwE9i5CU/k09r1mps6uqsTl
	jml1FXgLwFBAIkSNUI/IMM0wVC6/cs76mNvOMBVaERli7ogUk0gee+8wWjmpUV4moPSTRtYbwsaph
	hYd7Inzg==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgoO-0000000BYUG-2GDU
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:18:54 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e6dcc22cbcso939920a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474730; cv=none;
        d=google.com; s=arc-20240605;
        b=ZIL7K5QmW4MZJk3vfQC3ZyqTR4xSHc2SdYNwLO4f9w1RRT/ywkaSyahVlh5gs4tVTG
         aG7DHwcPYTk0vTjlVWCQQHSYSQb2wPf+0odikuEkBpTfCcUVHIzaain0U4qZgSNLcUP/
         IKHrFjU8Pa27LVfQI/OkiDS5fzWg6wmBuLnZlyBTY1zwvO4Tz5rnk1QZRc75HaeSvpO9
         F1hvOBWqq39l4lPhi8JiRgbZYJZ4HRiiAsiEUURdNCGZpLUILafA1u6QxMvTgIlnt91N
         9n5WjPz9ty8LMHGVPRD6D0gzH/r6jKMIHF7C9xee1ve6oEKwpnp5G6m9yLPG6Xnj1mOX
         /Q5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=;
        fh=CgJiVTOlzDRHw/jbH1SOgUXyUk4nPSo/CgG7/kU5M+g=;
        b=UxqcCLzr86DuE1ckDJkqIVJOirIpzwg+t0bGQ4J/mNmQKpRnLZlPhPZqUPHhu8AuXL
         laZUByt6OrjK0snlZBI8c5um0tkBDU4KUv1jGtc0wUWNqavuSu6HsjahLRTvxoq4NRAp
         3ODWVvrH/d9d9kx5TMPx/qBmRkEK719NG2PQbG7VB8a4PAzCLCHic7APN1FbpqtUF4gA
         S+CKZGSYLAih/74wfmt4L+IsIw5TBQyahGqkzStdcp8yzpNhgwxNn1+/OgZ1l+Ta2vtS
         GcTdSviITMWHz7GTKt7pDtq4sYxGY+54oaH/udux31f6KHpHahpMnwewtBogmDRmC1p8
         WnTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474730; x=1781079530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=;
        b=RGySxos9iCNEhg2/BKxvjFS+IjzH+Q1ly9QkoBRlvJwH71SuXCeLiF1qAH6e3LXJ/7
         6xHaWR+lxQamCD0azTzy4sDfFqk63ujfkSYYDTRqjq4x6Ln17x3bQuWIrwDWrpvf9wS+
         q/oXCN/US7jJ81X5LHsjYVF/gOkYf2PKNmnwHVm8P/zXUvCC3djuIxZsQ10iU6wB03fE
         dgG5bSDtJDDvFSXjel+L7WGbhlHbQslAgV0b0EDMAAHpv/vxmPf/2RYt8ZBGCWzhtaGJ
         WEbNHa8YuMpYGNABU/tJMBpqIseTloDuXnE0ruHYdgpOXaipy+9qBFhgaz44RCa3RW+m
         EgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474730; x=1781079530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4egfNNVt2xLa6zMUvxHb6G3XcxjPLrCxY/SLCryO8sQ=;
        b=QDf3l8Me9Loazr/S+9cQ2ve8YnNmAvnbGdo/aqJfHoXpp+BzRwIdpRHWy7bOxAfhT6
         3gOy+9PTGOnd++cVQKmd9+1tm8c6l5j3sBZEwQntoLrDevROAoDM59bjl2BouNlsBLCR
         6DNtYVko2OQDYjiPDtLzSWRdxwSPSkYnIdjrrffhBfIG5UTSB7JA6OR76fFWc7RDLxGM
         C6yCk5Ac5CLxqEN9zniL0YYgrCXKQY2q6UxAzYoqgO5yNbifyjtMbLFubdduipLFKh4g
         4jDmSZ7QfCG1CErRbKjFiaHqZqN/ypLaoUOYn+CXJGKhXt/OfYdBsOvKTMQiM0lSmDil
         g9MQ==
X-Forwarded-Encrypted: i=1; AFNElJ+JVs/8HZ/xlN30jX/YnAH7NGK5mNUDnW7hLubEw2TbTLZ7Sgm+YL7biEob8lMkbk6WDPGtMUU+wzJ52Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+E2pG1I5Vydky2U7e1k+G8pPVdlnU7aDSrzp35HAGsb1hAgts
	ojG3f0tekTs+z+qHdVHJC0Ruzp9UIsp+2RhpoUZO3kdtketCPf5eyPx4ozy5dYlXho9MqHnbRjJ
	U1FdZxGACjbKrlmVaqWFpclI6lq+X/gXL/umOc71EGg==
X-Gm-Gg: Acq92OGGl9I5fzN7vClls9SI7esXu3Uz6qA9r6CiuwNjXfPqEiA01SqIrKcw7HlIFlz
	mnglnEb4g79WACRjMw0R5QJl3FqG8HrydR5rMU5HMWpcafXivAB+e+Oq3AQYFLhL7FPIlgnzn1q
	pNMUhOR3hLluwqUE5NUxtor2hUGwtHngmgYo6OuyI057P2l6IXHSS0PNjaizzfwTVOn0L7qD6aG
	pxG4D0KhCEiOo80PZeu5K/ph/B9LB+mrPBpkQBD76xbSCH8vdijOHUUM+/8RskO/BXR20BGU4Uk
	NIE2xwQDrGbRKtvAHrJkwJ1SbvyZNp00Y3m1FLunqZ4oAEgvfZdotE+4GP/J1IVIYVhtN9RKDrU
	ynPhmq1k6sn7wQgSuniSMrPEI/DBD4swuYyqllQ==
X-Received: by 2002:a05:6820:54c3:b0:69d:d865:92a1 with SMTP id
 006d021491bc7-69e480c295amr1114390eaf.46.1780474730648; Wed, 03 Jun 2026
 01:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513153901371U0gWZRa45N893VGbU7Gf9@zte.com.cn>
In-Reply-To: <20260513153901371U0gWZRa45N893VGbU7Gf9@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:38 +0530
X-Gm-Features: AVHnY4LEigot4AhNtC66fZLcPPwlJCbOuFMHio3ko1GV9_2T4M4j-tjxNz4y7Bc
Message-ID: <CAAhSdy0Wd2=hmJ_1ZXa1mB6ojt32HeA8AW43=GLh52_5DuZqmw@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: KVM: Add the split page cache for ioctl context
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091852_754404_3A45923E 
X-CRM114-Status: GOOD (  16.00  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTowOeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gQWRkIHRoZSBzcGxpdCBwYWdlIGNhY2hlIGZvciBkaXJ0eSBsb2dnaW5nIGVuYWJs
ZW1lbnQgYW5kIHRoZQo+IEtWTV9DTEVBUl9ESVJUWV9MT0cgaW9jdGwuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2t2bS9t
bXUuYyAgICAgICAgICAgICAgfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDc1YjBhOTUxYzFiYy4u
ZTJmNDA4NTQzMDVmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC05Myw2
ICs5Myw4IEBAIHN0cnVjdCBrdm1fYXJjaCB7Cj4KPiAgICAgICAgIC8qIEtWTV9DQVBfUklTQ1Zf
TVBfU1RBVEVfUkVTRVQgKi8KPiAgICAgICAgIGJvb2wgbXBfc3RhdGVfcmVzZXQ7Cj4gKwo+ICsg
ICAgICAgc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlIHNwbGl0X3BhZ2VfY2FjaGU7CgpSZW5h
bWUgaXQgdG8gcGdkX3NwbGl0X3BhZ2VfY2FjaGUgYW5kIGFkZCBpdCBiZWxvdwpwZ2RfbGV2ZWxz
LgoKPiAgfTsKPgo+ICBzdHJ1Y3Qga3ZtX2NwdV90cmFwIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDJkM2RlZjAyNDI3
MC4uODVhM2ZiMjYyMmE0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNTQ5LDYgKzU0OSw3IEBAIGludCBrdm1fcmlz
Y3ZfbW11X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICBrdm0tPmFyY2gucGdk
ID0gcGFnZV90b192aXJ0KHBnZF9wYWdlKTsKPiAgICAgICAgIGt2bS0+YXJjaC5wZ2RfcGh5cyA9
IHBhZ2VfdG9fcGh5cyhwZ2RfcGFnZSk7Cj4gICAgICAgICBrdm0tPmFyY2gucGdkX2xldmVscyA9
IGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gKyAgICAgICBrdm0tPmFyY2guc3Bs
aXRfcGFnZV9jYWNoZS5nZnBfemVybyA9IF9fR0ZQX1pFUk87Cj4KPiAgICAgICAgIHJldHVybiAw
Owo+ICB9Cj4gQEAgLTU3Miw2ICs1NzMsOCBAQCB2b2lkIGt2bV9yaXNjdl9tbXVfZnJlZV9wZ2Qo
c3RydWN0IGt2bSAqa3ZtKQo+Cj4gICAgICAgICBpZiAocGdkKQo+ICAgICAgICAgICAgICAgICBm
cmVlX3BhZ2VzKCh1bnNpZ25lZCBsb25nKXBnZCwgZ2V0X29yZGVyKGt2bV9yaXNjdl9nc3RhZ2Vf
cGdkX3NpemUpKTsKPiArCj4gKyAgICAgICBrdm1fbW11X2ZyZWVfbWVtb3J5X2NhY2hlKCZrdm0t
PmFyY2guc3BsaXRfcGFnZV9jYWNoZSk7Cj4gIH0KPgo+ICB2b2lkIGt2bV9yaXNjdl9tbXVfdXBk
YXRlX2hnYXRwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAtLQo+IDIuMjcuMAoKUmVnYXJkcywK
QW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
