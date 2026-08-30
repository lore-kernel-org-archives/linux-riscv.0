Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D621C61DD6
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 01:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LF8KnGzUNww71kvMlw4Mq/uDMRr2Ftjm+KCDNn4haF0=; b=4yQ9pU7rsUSwGP
	Y19OY90+CzDPZtK+NnbtuPuiwvhBuJo4/OGaTdu/h3hJW0iCfENyFbi83XK/ZhIolfOfsQKAzs+2g
	QdZSTaXzoCWpIjQnshzjACusqjBVxA0ivnirXXkQhCPWLCvo+mr1xag8nujADR7HTW5kCANJTC3em
	oO1zbaApOJZItffAWcG0IO0sLP3SY8p5WWI0ioZK6qdENS9P0ohsx9zcLU9OsrKmVJOvTHllkNPO7
	awtQaPAuKEBrRihAUa0qiYjxsz57VZJgeptFbwfMRCmzWnV2PqKpiW13D6WSUqMZ6FTPGp49wzRcJ
	FGvJUOQeIDyl5uTHkSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0UQE-00000007Q2Z-0OEx;
	Sun, 30 Aug 2026 01:33:22 +0000
Received: from mail-pz2-x03.google.com ([2607:f8b0:4864:3b::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0UQC-00000007Q28-1NvD
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 01:33:21 +0000
Received: by mail-pz2-x03.google.com with SMTP id 41be03b00d2f7-cc1c2963c92so776415a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Aug 2026 18:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788053599; x=1788658399; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uemCnbI4NOWffBqE2fLB5b76TLqLWSQp97k3pFWmors=;
        b=CjKN2CwWKWe3gG929lj1XjrK8cPPCd64aECXxKjX7TwfRXFoh7R7qCfC/Dt8op4F1m
         HDboEqJuKPaW9AOPpr4cxyCXPKfL9ydPWKaYtaLK/+bNt4hBhgT2Zt3PkdW6imWuv42w
         ZvwW35biTIyR+zOZYNbXAEQAoxlk7Gwwb9O0UziKQPFIrawlpRDDuC2cK7CoHuJah1PF
         Z2TYi6OD2vdKMm45YbwX8JxQ7lEfzmT+/kntkMrxeqJhJgz4rF4ATQeqFBm+XJbbpjEZ
         CD+9ntJB1vkLay7ZRC9i9uCP8RhnGyjMiKjB1uEQuPeRZLIO3pZnMFZ5XHne1Zzx6P1v
         HwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788053599; x=1788658399;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uemCnbI4NOWffBqE2fLB5b76TLqLWSQp97k3pFWmors=;
        b=kzOKYdx9ypnzW84+W+l26YV6s36u5G7vQQLJCvCrSKgTiPZOoinpnTnTKDfLi89WO8
         XYQ4JqU4rbkhEHkkdbLwdwR5QxVw1n1ex87TolvtzP2qB5oDfdFl+tQNAQoO4yIvfhrz
         +QBM1DXqNYkZ96ChqUlF74Z7ZsgM3l7y4u1y7BZH7y3eteRTvsyN71UWHSCuhuadS9Km
         rboEgLkNnfb27RM7Rx6WGoezcmTC9JrwZ3j+qmO2VDKbpgzNdimMww0uXMvJmTdfZwTy
         zNj4Y6awuyYih3e26oVM7KmysOClJfvpEg77SUuHInNpgaPzpKh5N2sNf8+LUveJ3g+X
         czoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGGgpsrKxfu5CVpf+uol2OaMiLsZGS1dzBKb6ehHS2O3JmQ7VIrvZONj1X7vUTKXY6HCe7o/l1XeLTPQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k/TU0diec1fySx4W1FY5NP/ok1WAYVhsd/h94VT9PZzL4h2aBl
	iQ3Q8h7zVbRyteAJMh1i5qHHesqDV7z5FDOLoKEOZINGTqCxfH72uC4o
X-Gm-Gg: AR+sD12kY8VjiAzoF1ZcornA/h5vE7GHs58w9dVGl+VqDJYSKJItnnklkc3QtCb6vTJ
	fUSxdiU8DXdZ5DYLKzfvnchi3XgqWg8AtMqYvjNqV3zT6Oz8Ot9OPfraBabRrgu2qDrgHru948g
	57lpT0Op8ztEkFZXPQzIS1c383MAE9ybCcYebLrL53X2ZG9bu1oli5+XfWtjLL/lShVENhjLbCl
	BBLmBw+gXqWy/U4ukH/deG4jqtlkXw8M1cRNRIXOBz1xW+wfO8FJw46iyBdmf3pYhzTjxajdPR1
	4yxC2LupEJvvBoX92u19LagfNe14Q5gkE+GsLi13k4pXJYRchu9xdLiT0XSZFBG31gx8ClknZqO
	pVg+T1VPYTeYK9WohNAaQRkfExbEqg1Ky5i7Fdkjn+5oG/4ohLofCvVwbdZpwECdABb7yDD9X9N
	QDZNJYlkSg7efNJvJcONzpRaOxZgB8SOOlxET6PNn+eD1+UXDbVDsjzMKhIwAA0+bg5FzHSGpnD
	eNbiG8KrZ01VA==
X-Received: by 2002:a05:6a00:4f8e:b0:857:73e2:9102 with SMTP id d2e1a72fcca58-85773e29356mr13611225b3a.18.1788053598822;
        Sat, 29 Aug 2026 18:33:18 -0700 (PDT)
Received: from hppc-archlinux.localnet ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a2ea798esm1818145b3a.32.2026.08.29.18.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 18:33:18 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Date: Sun, 30 Aug 2026 09:33:12 +0800
Message-ID: <f-IgWNAyTmaoW34tfNxIvg@gmail.com>
In-Reply-To: <apL7ctZhcN5t77Yu@wyuan.org>
References: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
 <apL7ctZhcN5t77Yu@wyuan.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_183320_408190_318B7671 
X-CRM114-Status: GOOD (  22.52  )
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

T24gU2F0dXJkYXksIEF1Z3VzdCAyOSwgMjAyNiAxMTozMjowMuKAr1BNIENoaW5hIFN0YW5kYXJk
IFRpbWUgV2VpamllIFl1YW4gCndyb3RlOgo+IEhpLCBpdCdzIG1lIGFnYWluIDstKQo+IAo+IE9u
IFNhdCwgQXVnIDI5LCAyMDI2IGF0IDEyOjE1OjEwUE0gKzA4MDAsIFl1a2FpIFd1IHdyb3RlOgo+
ID4gVXBkYXRlIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0IHRyYW5zbGF0
aW9uLgo+ID4gCj4gPiBVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IDk1NDI2
MGZmNWE0Ngo+ID4gKCJSZXZlcnQgIlJJU0MtVjogbW06IERvY3VtZW50IG1tYXAgY2hhbmdlcyIi
KQo+IAo+IFNvbWVob3cgSSBndWVzcyB5b3UgZGlkbid0IGdldCB0aGUgYWN0dWFsIG1lYW5pbmcg
YmVoaW5kIHRoaXMgIlVwZGF0ZSB4eHgKPiB0aHJvdWdoIGNvbW1pdC4uLiIuCj4gCj4gQ29ycmVj
dCBtZSBpZiBJJ20gd3JvbmcuIElmIHlvdSB3cml0ZSB0aGlzIGxpbmUgaW4geW91ciBjb21taXQg
bWVzc2FnZS4KPiBUaGVuIGl0IG1lYW5zIGlmIHdlIGFwcGx5IHRoaXMgcGF0Y2ggb2YgeW91cnMu
IFRoZSBDaGluZXNlIGRvY3VtZW50YXRpb24KPiBvZiB0aGlzIGZpbGUgc2hvdWxkIGJlIGFscmVh
ZHkgX2NvbXBsZXRlbHlfIHN5bmNocm9uaXplZC4KPiAKCkkgYWdyZWUuIE15IGZhdWx0IGFnYWlu
LgoKPiBIb3dldmVyLCB0aGUgY3VycmVudCB0cmFuc2xhdGlvbiBvZiB0aGlzIGZpbGUgaXMgbWlz
c2luZyB0aGlzIHBhcnQ6Cj4gCj4gUklTQy1WIExpbnV4IEtlcm5lbCBTVjU3Cj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gCj4gLi4uIHdoaWNoIGlzIG5vdCB0cmFuc2xhdGVkL3N5bmNocm9u
aXplZCBpbiB5b3VyIHBhdGNoLgo+IAo+IAoKRGlkbid0IHNlZSB0aGF0IGJlY2F1c2UgSSBqdXN0
IHVzZWQgdGhlIHRvb2xzL2RvY3MvY2hlY2t0cmFuc3VwZGF0ZS5weSBzY3JpcHQsIAp3aGljaCBj
YW5ub3Qgc2VlIHRoZSBjb21taXRzIGJlZm9yZSBlZDg0M2FlOTQ3ZjggKCJkb2NzOiBtb3ZlIHJp
c2N2IHVuZGVyIAphcmNoIikuIFRoYXQgY29tbWl0IGp1c3QgbW92ZWQgdGhlIENoaW5lc2UgdHJh
bnNsYXRpb24gYnV0IHdhcyB0cmVhdGVkIGFzIGFuIAp1cGRhdGUgYnkgdGhlIHNjcmlwdC4gQW5k
IEkgb25seSBsb29rZWQgYXQgdGhlIGNvbW1pdHMgcmVwb3J0ZWQgYnkgdGhlIHNjcmlwdC4KCj4g
Tm90ZSB0aGF0IEknbSBub3QgYmxhbWluZyBvbiB5b3UgZm9yIHRoaXMuIEJ1dCBJIGZlZWwgdGhp
cyBpcyBhIHBvaW50Cj4gdGhhdCBhIG5ld2NvbWVyIG1pZ2h0IGZpbmQgY29uZnVzaW5nLCBpbmNs
dWRpbmcgbWUgYW5kIENoZW4tWXUgYSBjb3VwbGUKPiBvZiB3ZWVrcyBhZ28sIGlmIGRpZCBub3Qg
cmVhZCB0aGUgc2NyaXB0Lgo+IAo+IE91ciBjdXJyZW50IGhvdy10by5yc3Qgb25seSBhc2tzIHRv
IHdyaXRlIHRoaXMgbGluZSBpbiB0aGUgY29tbWl0Cj4gbWVzc2FnZSBidXQgZG9lcyBub3QgZXhw
bGFpbiB0aGUgcmVzdWx0cyBvciB0aGUgYWN0dWFsIHdvcmsgYmVoaW5kIGl0Lgo+IAo+IFsuLi5d
Cj4gCVVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21taXQgYjA4MGU1MjExMGVhCj4g
CSgiZG9jczogdXBkYXRlIHNlbGYtcHJvdGVjdGlvbiBfX3JvX2FmdGVyX2luaXQgc3RhdHVzIikK
PiAJIyDor7fmiafooYwgZ2l0IGxvZyAtLW9uZWxpbmUgPOaCqOe/u+ivkeeahOiLseaWh+aWh+ah
o+i3r+W+hD7vvIzlubbmm7/mjaLkuIrov7DlhoXlrrkKPiAKPiAJU28gd2hlbiBhIG5ld2NvbWVy
IGNvbWVzIGFuZCBqdXN0IGRvZXMgd2hhdCB0aGlzIGFza3MsIHdpdGhvdXQKPiAJY29uc2lkZXJp
bmcgd2hldGhlciBoaXMvaGVyL2l0cyB0cmFuc2xhdGlvbiBpcyBjb21wbGV0ZWx5Cj4gCXN5bmNo
cm9uaXplZCBvciBub3QsIG91ciBzY3JpcHQgd291bGQgYmUga2luZCBvZiBpbmFjY3VyYXRlLiA/
Cj4gCj4gTWF5YmUgd2UgY2FuIGFkZCBhIGRlc2NyaXB0aW9uIG9yIGEgaGludCBsaWtlOgo+IAo+
IElmIHlvdXIgY3VycmVudCBjaGFuZ2VzIG1ha2UgdGhlIHRyYW5zbGF0aW9uIGNvbXBsZXRlbHkg
aW4gbGluZSB3aXRoIHRoZQo+IEVuZ2xpc2ggdmVyc2lvbiwgdGhlbiBwbGVhc2UgYWRkIHRoaXMg
bGluZSBhZnRlciB5b3VyIGRlc2NyaXB0aW9ucyBhbmQKPiBiZWZvcmUgYSBibGFuayBsaW5lIGFu
ZCB5b3VyIHNpZ24tb2ZmOgo+IAo+IFVwZGF0ZSB0aGUgdHJhbnNsYXRpb24gdGhyb3VnaCBjb21t
aXQgZTgzYzUxNjMzMTZmCj4gKEluaXRpYWwgcmV2aXNpb24gb2YgImdpdCIsIHRoZSBpbmZvcm1h
dGlvbiBtYW5hZ2VyIGZyb20gaGVsbCkKPiAKPiAuLnRoZW4gZm9sbG93cyBhIHRlbXBsYXRlIGNv
bW1pdCBtZXNzYWdlCgpBbGxvd2luZyBwYXJ0aWFsIHVwZGF0ZXMgdG8gdGhlIHRyYW5zbGF0aW9u
PwoKPiAKPiAKPiBBbnkgaWRlYXM/Cj4gCj4gKFNob3VsZCBJIGNjIHRoZSBvcmlnaW5hbCBhdXRo
b3JzIG9mIHRoZSBzY3JpcHQ/KQoKQ0MgdGhlIGF1dGhvcnMgb2YgdGhlIGNoZWNrdHJhbnN1cGRh
dGUucHkgc2NyaXB0PwoKPiAKPiBUaGFua3MuCgpCZXN0LApZdWthaSBXdQoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
