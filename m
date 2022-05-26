Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C5CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 00:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eBoHv3umi3um15oEO7usiNlptR2CvJKm5HtKzcIOwv8=; b=VRjA0o0tGjRp7UvllNRDdEKnmG
	QE8QEApmSGt95rKpekDcIkOJPY+BpNTA3BHJMhyEanin2FGrnJe2V1yos+cvtOKTE7BhTJZibvqH7
	4CbZUkacGqm/8qCNDgzCHZ3ptQ6jIHpwTE/lgoLWP0r1JUqttlaSAIydL1Mh0aLPwP0KmDQOZsdpu
	i+nhvc9lMh1THzWVUz1xOmIG/uGpVyTosN2xgULhXwPpsMU+Mh332RQRAQlEh09JVQ6xFTLZr7dCm
	5bOgJhh/XEqLYineAmG5TiKXrp718fpBsVPhwzIPB6Q6CEqsCOtCVj4nJWewsIk9K4yerQTdw4AAL
	xhTzevXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1aw-00D5wd-1E; Thu, 26 May 2022 00:43:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1at-00D5uz-4D
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 00:43:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id p8so394423pfh.8
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 17:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=sZBB3cFJmHUKx647UvH8/q/X0Zv3XJtlmYlf4oGcSPQ=;
        b=k79hTMklqRVciCR3lGtpKRUXYMofhOcscF0ctAqoTwqO2GaIXsepK3iVYkd5VLpLDE
         VmGliHiJsqBbCa5Ka5QizTlvASwyKy19TIz8rRKUSiKpFVD4D531/gZpyC4eEPOwnD3z
         R0+d+uwUZNyfZlRIfZrYlRdc+gRLwk3h4j0b61sXHe9B54wRb81lilUNrv3FHPUhfGGN
         ewYwOsvjkGZFpC/5j3nNakOHz+raQjG6KChm/YMdaZuqXCIH1c8+HgPIt0sDatnjE1oF
         Bb+SoHcLYC5aM8ES/8uJHulkcuNU2vPyeZVt+zk/rBGC/5/Zj65hIzgD627evhuRRiaS
         Jx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=sZBB3cFJmHUKx647UvH8/q/X0Zv3XJtlmYlf4oGcSPQ=;
        b=XEHeGZvFAX+jesSU/9/Ft+/WYS1qKw6ZP1GqTjEWR/eR5wbjInM9rr9eIVlnLuq3jk
         2NpXbQwnTsp4AdLHkQLalWEcGKOdLWrJNDwfSeS/6KnLU5aQtKwghhS6DTRgsK5Ua5Q7
         hRDfMWwPymMOaKrPrhGIW621FZ4g0kir9LiilQyuSW+OYvxkg1JcHe6uQec9PPOihTvO
         U0w2P7+lEURbsRQ/Kop9iWL7Ugty+oSCv9VS7o2/T9vriDcoIiz8SLfGlMp1y/AuT+fo
         B6EwwauPqwm49UqW0nt6DuBqyDUUDmkdVhiFkD2/GwqAQ0Q/u5Q592FrrldXR/umDIBW
         1uQA==
X-Gm-Message-State: AOAM533FQgD1BUABh5+PJMcWJgU82xL7c3ydfZNhv2AciL61nU5qRmaD
	hwfs6RkYbP5jLkd7fggyLi3H3A==
X-Google-Smtp-Source: ABdhPJx8vwGw6JLFkrwBwLIK5yJUQGsA2KqzjYt3TFr6QV9jVWuq3AzgqDtE5ELg2KebDykhsTkZlQ==
X-Received: by 2002:a05:6a00:194f:b0:518:81fe:fcc6 with SMTP id s15-20020a056a00194f00b0051881fefcc6mr24241050pfk.64.1653525791230;
        Wed, 25 May 2022 17:43:11 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id k13-20020a170902ce0d00b001635b86a790sm27389plg.44.2022.05.25.17.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 17:43:10 -0700 (PDT)
Date: Wed, 25 May 2022 17:43:10 -0700 (PDT)
X-Google-Original-Date: Wed, 25 May 2022 17:42:57 PDT (-0700)
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
In-Reply-To: <mhng-7a88227d-dc64-4d87-9e1a-0ea802ddf0a1@palmer-ri-x1c9>
CC: linux@roeck-us.net, Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de,
  linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
  guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-54a3577b-2ae9-4ca0-a27d-f75f13807a29@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_174315_229248_7EF6CA9A 
X-CRM114-Status: GOOD (  22.70  )
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

T24gV2VkLCAyNSBNYXkgMjAyMiAxNzozOTozOSBQRFQgKC0wNzAwKSwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gV2VkLCAyNSBNYXkgMjAyMiAxNTo1NjowNyBQRFQgKC0wNzAwKSwgbGludXhA
cm9lY2stdXMubmV0IHdyb3RlOgo+PiBPbiA1LzI1LzIyIDE0OjM0LCBQYWxtZXIgRGFiYmVsdCB3
cm90ZToKPj4+IE9uIFdlZCwgMjUgTWF5IDIwMjIgMTQ6MTU6MDMgUERUICgtMDcwMCksIGxpbnV4
QHJvZWNrLXVzLm5ldCB3cm90ZToKPj4+PiBPbiA1LzI1LzIyIDA5OjA0LCBndW9yZW5Aa2VybmVs
Lm9yZyB3cm90ZToKPj4+Pj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29t
Pgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIGEgZml4dXAgZm9yIHZkc28gaW1wbGVtZW50YXRpb24gd2hp
Y2ggY2F1c2VkIG11c2wgdG8KPj4+Pj4gZmFpbC4KPj4+Pj4KPj4+Pj4gW8KgwqAgMTEuNjAwMDgy
XSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPj4+Pj4gW8KgwqAgMTEuNjI4NTYxXSBp
bml0WzFdOiB1bmhhbmRsZWQgc2lnbmFsIDExIGNvZGUgMHgxIGF0Cj4+Pj4+IDB4MDAwMDAwMDAw
MDAwMDAwMCBpbiBsaWJjLnNvW2ZmZmZmZjhhZDM5MDAwK2E0MDAwXQo+Pj4+PiBbwqDCoCAxMS42
MjkzOThdIENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRlZAo+Pj4+PiA1LjE4LjAt
cmM3LW5leHQtMjAyMjA1MjAgIzEKPj4+Pj4gW8KgwqAgMTEuNjI5NDYyXSBIYXJkd2FyZSBuYW1l
OiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+Pj4+IFvCoMKgIDExLjYyOTU0Nl0gZXBjIDogMDBm
ZmZmZmY4YWRhMTEwMCByYSA6IDAwZmZmZmZmOGFkYTEzYzggc3AgOgo+Pj4+PiAwMGZmZmZmZmM1
ODE5OWYwCj4+Pj4+IFvCoMKgIDExLjYyOTU4Nl3CoCBncCA6IDAwZmZmZmZmOGFkMzkwMDAgdHAg
OiAwMGZmZmZmZjhhZGUwOTk4IHQwIDoKPj4+Pj4gZmZmZmZmZmZmZmZmZmZmZgo+Pj4+PiBbwqDC
oCAxMS42Mjk1OThdwqAgdDEgOiAwMGZmZmZmZmM1ODE5ZmQwIHQyIDogMDAwMDAwMDAwMDAwMDAw
MCBzMCA6Cj4+Pj4+IDAwZmZmZmZmOGFkZTBjYzAKPj4+Pj4gW8KgwqAgMTEuNjI5NjEwXcKgIHMx
IDogMDBmZmZmZmY4YWRlMGNjMCBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOgo+Pj4+PiAwMGZm
ZmZmZmM1ODE5YTAwCj4+Pj4+IFvCoMKgIDExLjYyOTYyMl3CoCBhMiA6IDAwMDAwMDAwMDAwMDAw
MDEgYTMgOiAwMDAwMDAwMDAwMDAwMDFlIGE0IDoKPj4+Pj4gMDBmZmZmZmZjNTgxOWIwMAo+Pj4+
PiBbwqDCoCAxMS42Mjk2MzRdwqAgYTUgOiAwMGZmZmZmZmM1ODE5YjAwIGE2IDogMDAwMDAwMDAw
MDAwMDAwMCBhNyA6Cj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAKPj4+Pj4gW8KgwqAgMTEuNjI5NjQ1
XcKgIHMyIDogMDBmZmZmZmY4YWRlMGFjOCBzMyA6IDAwZmZmZmZmOGFkZTBlYzggczQgOgo+Pj4+
PiAwMGZmZmZmZjhhZGUwNzI4Cj4+Pj4+IFvCoMKgIDExLjYyOTY1Nl3CoCBzNSA6IDAwZmZmZmZm
OGFkZTBhOTAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3IDoKPj4+Pj4gMDBmZmZmZmZjNTgxOWU0
MAo+Pj4+PiBbwqDCoCAxMS42Mjk2NjddwqAgczggOiAwMGZmZmZmZjhhZGUwY2EwIHM5IDogMDBm
ZmZmZmY4YWRkYmE1MCBzMTA6Cj4+Pj4+IDAwMDAwMDAwMDAwMDAwMDAKPj4+Pj4gW8KgwqAgMTEu
NjI5Njc4XcKgIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDIgdDQg
Ogo+Pj4+PiAwMDAwMDAwMDAwMDAwMDAxCj4+Pj4+IFvCoMKgIDExLjYyOTY4OF3CoCB0NSA6IDAw
MDAwMDAwMDAwMjAwMDAgdDYgOiBmZmZmZmZmZmZmZmZmZmZmCj4+Pj4+IFvCoMKgIDExLjYyOTY5
OV0gc3RhdHVzOiAwMDAwMDAwMDAwMDA0MDIwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAKPj4+
Pj4gY2F1c2U6IDAwMDAwMDAwMDAwMDAwMGQKPj4+Pj4KPj4+Pj4gVGhlIGxhc3QgX192ZHNvX2lu
aXQoJmNvbXBhdF92ZHNvX2luZm8pIHJlcGxhY2VzIHRoZSBkYXRhIGluIG5vcm1hbAo+Pj4+PiB2
ZHNvX2luZm8uIFRoaXMgaXMgYW4gb2J2aW91cyBidWcuCj4+Pj4+Cj4+Pj4+IFJlcG9ydGVkLWJ5
OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+Pj4+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQGRhYmJlbHQuY29tPgo+Pj4+PiBDYzogSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5k
ZT4KPj4+Pgo+Pj4+IFRlc3RlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
Pgo+Pj4KPj4+IFNvcnJ5IEknbSBhIGJpdCBidXJpZWQgcmlnaHQgbm93LCB0aGlzIGlzIGZpeGlu
ZyB0aGUgaXNzdWUgeW91IHBvaW50ZWQgb3V0IGVhcmxpZXI/Cj4+Pgo+PiBZZXMuCj4KPiBBd29z
b21lLCBJIHRoaW5rIHRoYXQgd2FzIHRoZSBvbmx5IGJpZyBibG9ja2VyIHNvIGZhci4KPgo+IEkg
YWRkZWQgYSBtdXNsLWJhc2VkIHVzZXJzcGFjZSB0byBteSB0ZXN0IHNldHVwLCB3aGljaCBpcyBy
djY0LW9ubHkKPiAoYnVpbGRyb290IGRvZXNuJ3QgaGF2ZSBydjMyIG11c2wsIEkgdGhvdWdodCB1
cHN0cmVhbSBoYWQgaXQgYnV0IG1heWJlCj4gaSdtIG1pc3JlbWVtYmVyaW5nKS4gIFRoaXMgcGF0
Y2ggZml4ZXMgdGhlIGJ1Zywgc28gSSd2ZSBhZGRlZCBpdCB0bwo+IGZvci1uZXh0IHdpdGgKCkp1
c3Qgc2F3IHRoZSB2Miwgc28gSSdtIHVzaW5nIHRoYXQgaW5zdGVhZC4KCj4KPiBGaXhlczogMzA5
MmViNDU2Mzc1ICgicmlzY3Y6IGNvbXBhdDogdmRzbzogQWRkIHNldHVwIGFkZGl0aW9uYWwgcGFn
ZXMgaW1wbGVtZW50YXRpb24iKQo+Cj4gd2hpY2ggSSB0aGluayBpcyBjb3JyZWN0LCBidXQgTE1L
IGlmIHRoZXJlJ3MgYW4gaXNzdWUuCj4KPiBUaGFua3MhCj4KPiAoYW5kIGFsc28gc29ycnkgSSBw
b2tlZCBHZWVydCBpbnN0ZWFkIG9mIHlvdSBhYm91dCB0aGlzIG9uZSwgb29wcyA7KSkKPgo+Pgo+
PiBUaGFua3MsCj4+IEd1ZW50ZXIKPj4KPj4+Pgo+Pj4+PiAtLS0KPj4+Pj4gwqAgYXJjaC9yaXNj
di9rZXJuZWwvdmRzby5jIHwgMTUgKysrKysrKysrKysrKy0tCj4+Pj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5j
Cj4+Pj4+IGluZGV4IDUwZmU0Yzg3NzYwMy4uNjliMDViNmMxODFiIDEwMDY0NAo+Pj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dmRzby5jCj4+Pj4+IEBAIC0yMDYsMTIgKzIwNiwyMyBAQCBzdGF0aWMgc3RydWN0IF9fdmRzb19p
bmZvIHZkc29faW5mbyBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+Pj4+IMKgIH07Cj4+Pj4+Cj4+Pj4+
IMKgICNpZmRlZiBDT05GSUdfQ09NUEFUCj4+Pj4+ICtzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxf
bWFwcGluZyBydl9jb21wYXRfdmRzb19tYXBzW10gX19yb19hZnRlcl9pbml0ID0gewo+Pj4+PiAr
wqDCoMKgIFtSVl9WRFNPX01BUF9WVkFSXSA9IHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1l
wqDCoCA9ICJbdnZhcl0iLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLmZhdWx0ID0gdnZhcl9mYXVs
dCwKPj4+Pj4gK8KgwqDCoCB9LAo+Pj4+PiArwqDCoMKgIFtSVl9WRFNPX01BUF9WRFNPXSA9IHsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lwqDCoCA9ICJbdmRzb10iLAo+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgLm1yZW1hcCA9IHZkc29fbXJlbWFwLAo+Pj4+PiArwqDCoMKgIH0sCj4+Pj4+ICt9
Owo+Pj4+PiArCj4+Pj4+IMKgIHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2luZm8gY29tcGF0X3Zkc29f
aW5mbyBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+Pj4+IMKgwqDCoMKgwqAgLm5hbWUgPSAiY29tcGF0
X3Zkc28iLAo+Pj4+PiDCoMKgwqDCoMKgIC52ZHNvX2NvZGVfc3RhcnQgPSBjb21wYXRfdmRzb19z
dGFydCwKPj4+Pj4gwqDCoMKgwqDCoCAudmRzb19jb2RlX2VuZCA9IGNvbXBhdF92ZHNvX2VuZCwK
Pj4+Pj4gLcKgwqDCoCAuZG0gPSAmcnZfdmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZWQVJdLAo+Pj4+
PiAtwqDCoMKgIC5jbSA9ICZydl92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10sCj4+Pj4+ICvC
oMKgwqAgLmRtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZBUl0sCj4+Pj4+
ICvCoMKgwqAgLmNtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVkRTT10sCj4+
Pj4+IMKgIH07Cj4+Pj4+IMKgICNlbmRpZgo+Pj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
