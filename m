Return-Path: <SRS0=4eYz=VC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C50C46499
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2019 14:47:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED10F20989
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2019 14:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bsarjk9K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qnO9a1Wk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTYoIrLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED10F20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwlCoz0CC1/xdZ6chtn7VuWKNgpDEf6OJyb/ZU90iXU=; b=Bsarjk9KAQgsXM
	uV96G7bfUuANfrHhv9VBRp0vgja4zNOQJ6zaH6yLKdOQ106oTXftHXn9UYyR/gGmO4XsaX2dRYkC4
	piTZHPVrHXyGyrWhNUlCrBpj63rDC8qc3lSb5ncH8o4ds/Kize1ywOOx9276JLcrh6l7DpAGNQRiZ
	4kPF5Q+RWacbamZw/Z2UcJmESnc88612MDn8H+0KOTQiJq/8B8qF8/Puyr8M6IfM+GLZ5i7eMvPJF
	fxFq+okv4fvIv4xNDIo6y2OKyBmXSW6sTZYQAfINpCjCtwuvcqMdNh6f/6TGSLuH600MUkQ5Oqhgm
	8Zh88n2RS2vuVSRr+Gjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjPUZ-0002g4-N6; Fri, 05 Jul 2019 14:47:15 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjPRg-0006H5-KJ
 for linux-riscv@bombadil.infradead.org; Fri, 05 Jul 2019 14:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PZ7J1xjsbzm1U/of1KhsZpOdk4BLy/jqSSNr0GyJ1Og=; b=qnO9a1WkZLlw9EFd+pg5XLyQhQ
 Fc04jm9LqSysa+1DDHz1xg3FnURH/hUE7LBWfiVkDRrNy2W1nUDjg3f1Gqd/SEntbZXIeiz34uax5
 wrmg2Sdd3ZA7hcmNicNE778H2sfFZ32sC6C/IqToY63KaM3vE8Ccb3Aa+X3lqZT9Dv8IorgSFDx0Q
 1b7nfN2I6UeilHaKfXBFBDmNvIclqTQnoavahQ/4ZVuqDFeXlqNSOrUxrVCFqTPUlDFY5yq9vcktq
 GqXIJcRmtCKzRrM8dzkzyZZfGRRD+3To7iIx4XOvlf7abg/sJiSP/ggbOBt8wMV79XdULuoVTjZV1
 78igsxEg==;
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjHmf-000882-Ky
 for linux-riscv@lists.infradead.org; Fri, 05 Jul 2019 06:33:27 +0000
Received: by mail-qt1-x841.google.com with SMTP id y57so7961823qtk.4
 for <linux-riscv@lists.infradead.org>; Thu, 04 Jul 2019 23:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PZ7J1xjsbzm1U/of1KhsZpOdk4BLy/jqSSNr0GyJ1Og=;
 b=kTYoIrLiHNVlf8mJdGVchtMrXO9vACuma/1M3y8WcbkCkzbhmbYnkZl8hU4MqPhxq0
 hzQffvUAThjMmmzI5zAEXXgjNVoZgmKvm3ihA9NSyjGYlJwKXUFfforoHouQkgDJLXEq
 wbVWB2nsiaAAvRpjGjoGburer6g8LpVI/kqtqvtKZufX1lzDwZasK4EteXjgWs50RVEA
 +Sd4UvQM9A5makPgQEWm4jcafa3xbYhd4rvMqUe8fsP3iRokKTOs8MDq40DSw0fxPcHz
 fwGAptLf7RHmQPOLX/Q9abKKO+yNhJnxiqzgTDce+xU/KqZeUGUSR/LDS3vvqIJBDGlu
 ArGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PZ7J1xjsbzm1U/of1KhsZpOdk4BLy/jqSSNr0GyJ1Og=;
 b=ZiJPQK8wzIiMxUNXPOxcLQUEeYlcTaF+i7ZvJn7VR+fMoWkmFKFEngN3hIsBcYOQH9
 G71d7UgLS2BrzjhtRCLLPHnWOmJKUqUfYisv11qiofKNHBAeV2IZHysKDvZKyviYbpFl
 jbuUoyLhfj8adqw7Ho/vY/9GxrxDmD8HsK6y4iPoQ1oIpTU+33aq4CF23W7SEhH7K+Ov
 0ds3Zo/AfYR5d1Pbmj++jyKmvEDItKEWO+kXq50dR4MKLVSiZXEf7cDLCm5DyCRlca9M
 q/wcgNtUBGr9ZsTbGOg9BYgMZVnGsI/JQijTaoNZzvnmPr6v1OQZ3lC177GSOilthHX2
 tt6Q==
X-Gm-Message-State: APjAAAWf2NmGiOP1VBCPD3R0/jdEWQGOsGjiCPr/lQRhRrq2VlVYnvvQ
 grdqnNxjoZaBefX1D2hdZVuKyD5KnnxnvJica2g=
X-Google-Smtp-Source: APXvYqw3vejO55KsDt2ror9eB4zeFm4nWnhBt43Suis0p/V+EMnZEYIJGlrfJDBKGxdHEF9s4pqQwSDDwOwxjLlIWis=
X-Received: by 2002:a0c:ac98:: with SMTP id m24mr1873564qvc.9.1562308282034;
 Thu, 04 Jul 2019 23:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190705001803.30094-1-luke.r.nels@gmail.com>
In-Reply-To: <20190705001803.30094-1-luke.r.nels@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 5 Jul 2019 08:31:10 +0200
Message-ID: <CAJ+HfNi0Svv6w6_Xx-YPqBaOJnjGtxim_u0YdZacHynmfQaJTg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] Enable zext optimization for more RV64G ALU ops
To: Luke Nelson <lukenels@cs.washington.edu>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Luke Nelson <luke.r.nels@gmail.com>, Jiong Wang <jiong.wang@netronome.com>,
 Netdev <netdev@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Song Liu <liu.song.a23@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Yonghong Song <yhs@fb.com>,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <kafai@fb.com>,
 Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCA1IEp1bCAyMDE5IGF0IDAyOjE4LCBMdWtlIE5lbHNvbiA8bHVrZW5lbHNAY3Mud2Fz
aGluZ3Rvbi5lZHU+IHdyb3RlOgo+Cj4gY29tbWl0IDY2ZDBkNWE4NTRhNiAoInJpc2N2OiBicGY6
IGVsaW1pbmF0ZSB6ZXJvIGV4dGVuc2lvbiBjb2RlLWdlbiIpCj4gYWRkZWQgdGhlIG5ldyB6ZXJv
LWV4dGVuc2lvbiBvcHRpbWl6YXRpb24gZm9yIHNvbWUgQlBGIEFMVSBvcGVyYXRpb25zLgo+Cj4g
U2luY2UgdGhlbiwgYnVncyBpbiB0aGUgSklUIHRoYXQgaGF2ZSBiZWVuIGZpeGVkIGluIHRoZSBi
cGYgdHJlZSByZXF1aXJlCj4gdGhpcyBvcHRpbWl6YXRpb24gdG8gYmUgYWRkZWQgdG8gb3RoZXIg
b3BlcmF0aW9uczogY29tbWl0IDFlNjkyZjA5ZTA5MQo+ICgiYnBmLCByaXNjdjogY2xlYXIgaGln
aCAzMiBiaXRzIGZvciBBTFUzMiBhZGQvc3ViL25lZy9sc2gvcnNoL2Fyc2giKSwKPiBhbmQgY29t
bWl0IGZlMTIxZWU1MzFkMSAoImJwZiwgcmlzY3Y6IGNsZWFyIHRhcmdldCByZWdpc3RlciBoaWdo
IDMyLWJpdHMKPiBmb3IgYW5kL29yL3hvciBvbiBBTFUzMiIpCj4KPiBOb3cgdGhhdCB0aGVzZSBo
YXZlIGJlZW4gbWVyZ2VkIHRvIGJwZi1uZXh0LCB0aGUgemV4dCBvcHRpbWl6YXRpb24gY2FuCj4g
YmUgZW5hYmxlZCBmb3IgdGhlIGZpeGVkIG9wZXJhdGlvbnMuCj4KClRoYW5rcyBmb3IgdGhlIHBh
dGNoLCBMdWtlIQoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNv
bT4KCj4gQ2M6IFNvbmcgTGl1IDxsaXUuc29uZy5hMjNAZ21haWwuY29tPgo+IENjOiBKaW9uZyBX
YW5nIDxqaW9uZy53YW5nQG5ldHJvbm9tZS5jb20+Cj4gQ2M6IFhpIFdhbmcgPHhpLndhbmdAZ21h
aWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEx1a2UgTmVsc29uIDxsdWtlLnIubmVsc0BnbWFpbC5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcC5jIHwgMTYgKysrKysrKyst
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wLmMKPiBpbmRleCA4NzZjYjljNzA1Y2UuLjU0NTFlZjM4NDVm
MiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXAuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcC5jCj4gQEAgLTc1NywzMSArNzU3LDMxIEBAIHN0YXRp
YyBpbnQgZW1pdF9pbnNuKGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2pp
dF9jb250ZXh0ICpjdHgsCj4gICAgICAgICBjYXNlIEJQRl9BTFUgfCBCUEZfQUREIHwgQlBGX1g6
Cj4gICAgICAgICBjYXNlIEJQRl9BTFU2NCB8IEJQRl9BREQgfCBCUEZfWDoKPiAgICAgICAgICAg
ICAgICAgZW1pdChpczY0ID8gcnZfYWRkKHJkLCByZCwgcnMpIDogcnZfYWRkdyhyZCwgcmQsIHJz
KSwgY3R4KTsKPiAtICAgICAgICAgICAgICAgaWYgKCFpczY0KQo+ICsgICAgICAgICAgICAgICBp
ZiAoIWlzNjQgJiYgIWF1eC0+dmVyaWZpZXJfemV4dCkKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBlbWl0X3pleHRfMzIocmQsIGN0eCk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgY2FzZSBCUEZfQUxVIHwgQlBGX1NVQiB8IEJQRl9YOgo+ICAgICAgICAgY2FzZSBCUEZfQUxV
NjQgfCBCUEZfU1VCIHwgQlBGX1g6Cj4gICAgICAgICAgICAgICAgIGVtaXQoaXM2NCA/IHJ2X3N1
YihyZCwgcmQsIHJzKSA6IHJ2X3N1YncocmQsIHJkLCBycyksIGN0eCk7Cj4gLSAgICAgICAgICAg
ICAgIGlmICghaXM2NCkKPiArICAgICAgICAgICAgICAgaWYgKCFpczY0ICYmICFhdXgtPnZlcmlm
aWVyX3pleHQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF96ZXh0XzMyKHJkLCBjdHgp
Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgQlBGX0FMVSB8IEJQRl9B
TkQgfCBCUEZfWDoKPiAgICAgICAgIGNhc2UgQlBGX0FMVTY0IHwgQlBGX0FORCB8IEJQRl9YOgo+
ICAgICAgICAgICAgICAgICBlbWl0KHJ2X2FuZChyZCwgcmQsIHJzKSwgY3R4KTsKPiAtICAgICAg
ICAgICAgICAgaWYgKCFpczY0KQo+ICsgICAgICAgICAgICAgICBpZiAoIWlzNjQgJiYgIWF1eC0+
dmVyaWZpZXJfemV4dCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X3pleHRfMzIocmQs
IGN0eCk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBCUEZfQUxVIHwg
QlBGX09SIHwgQlBGX1g6Cj4gICAgICAgICBjYXNlIEJQRl9BTFU2NCB8IEJQRl9PUiB8IEJQRl9Y
Ogo+ICAgICAgICAgICAgICAgICBlbWl0KHJ2X29yKHJkLCByZCwgcnMpLCBjdHgpOwo+IC0gICAg
ICAgICAgICAgICBpZiAoIWlzNjQpCj4gKyAgICAgICAgICAgICAgIGlmICghaXM2NCAmJiAhYXV4
LT52ZXJpZmllcl96ZXh0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfemV4dF8zMihy
ZCwgY3R4KTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEJQRl9BTFUg
fCBCUEZfWE9SIHwgQlBGX1g6Cj4gICAgICAgICBjYXNlIEJQRl9BTFU2NCB8IEJQRl9YT1IgfCBC
UEZfWDoKPiAgICAgICAgICAgICAgICAgZW1pdChydl94b3IocmQsIHJkLCBycyksIGN0eCk7Cj4g
LSAgICAgICAgICAgICAgIGlmICghaXM2NCkKPiArICAgICAgICAgICAgICAgaWYgKCFpczY0ICYm
ICFhdXgtPnZlcmlmaWVyX3pleHQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZW1pdF96ZXh0
XzMyKHJkLCBjdHgpOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgQlBG
X0FMVSB8IEJQRl9NVUwgfCBCUEZfWDoKPiBAQCAtODExLDEzICs4MTEsMTMgQEAgc3RhdGljIGlu
dCBlbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2Nv
bnRleHQgKmN0eCwKPiAgICAgICAgIGNhc2UgQlBGX0FMVSB8IEJQRl9SU0ggfCBCUEZfWDoKPiAg
ICAgICAgIGNhc2UgQlBGX0FMVTY0IHwgQlBGX1JTSCB8IEJQRl9YOgo+ICAgICAgICAgICAgICAg
ICBlbWl0KGlzNjQgPyBydl9zcmwocmQsIHJkLCBycykgOiBydl9zcmx3KHJkLCByZCwgcnMpLCBj
dHgpOwo+IC0gICAgICAgICAgICAgICBpZiAoIWlzNjQpCj4gKyAgICAgICAgICAgICAgIGlmICgh
aXM2NCAmJiAhYXV4LT52ZXJpZmllcl96ZXh0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVt
aXRfemV4dF8zMihyZCwgY3R4KTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBj
YXNlIEJQRl9BTFUgfCBCUEZfQVJTSCB8IEJQRl9YOgo+ICAgICAgICAgY2FzZSBCUEZfQUxVNjQg
fCBCUEZfQVJTSCB8IEJQRl9YOgo+ICAgICAgICAgICAgICAgICBlbWl0KGlzNjQgPyBydl9zcmEo
cmQsIHJkLCBycykgOiBydl9zcmF3KHJkLCByZCwgcnMpLCBjdHgpOwo+IC0gICAgICAgICAgICAg
ICBpZiAoIWlzNjQpCj4gKyAgICAgICAgICAgICAgIGlmICghaXM2NCAmJiAhYXV4LT52ZXJpZmll
cl96ZXh0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRfemV4dF8zMihyZCwgY3R4KTsK
PiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiBAQCAtODI2LDcgKzgyNiw3IEBAIHN0YXRpYyBp
bnQgZW1pdF9pbnNuKGNvbnN0IHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgc3RydWN0IHJ2X2ppdF9j
b250ZXh0ICpjdHgsCj4gICAgICAgICBjYXNlIEJQRl9BTFU2NCB8IEJQRl9ORUc6Cj4gICAgICAg
ICAgICAgICAgIGVtaXQoaXM2NCA/IHJ2X3N1YihyZCwgUlZfUkVHX1pFUk8sIHJkKSA6Cj4gICAg
ICAgICAgICAgICAgICAgICAgcnZfc3VidyhyZCwgUlZfUkVHX1pFUk8sIHJkKSwgY3R4KTsKPiAt
ICAgICAgICAgICAgICAgaWYgKCFpczY0KQo+ICsgICAgICAgICAgICAgICBpZiAoIWlzNjQgJiYg
IWF1eC0+dmVyaWZpZXJfemV4dCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X3pleHRf
MzIocmQsIGN0eCk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gLS0KPiAyLjIwLjEKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
