Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8BBC55ABA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnC/Iybk5iazYUiKIwYRpP9tpZTTF0xHWPSEHxeTAmo=; b=ZXv3fBgzTUXo/G
	APx7K4gqYE0encO47MBbzqRqedc1GirgPn+P93tWvWU0lBAtGVKsVJm+nd9FacBuy/eUAq+jvhR1R
	tql4qFVrI4P5iqcHpZC7hxcyNH8ChAuTeVLzEFiPgWzKooIXv2VXzGPUUK+2pa3GN7IZwqHpHs940
	kxqpfWsXjgAZKY3xh0p5R3AP7/7Z/F4q5ziDDp64hnhxBpDbNmZVIkniNxX83GvWh0YQKnerhfnaa
	1DHwjcy3If1f7KFZSFmd1TZcApFAXJ1gYxa8lnAvBpQy290VESAY5MaljDQ71D4f5V9vba7aIGP1j
	QzTxvzqh1YWOjCzzX9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrevV-00000004Ipo-0reO;
	Wed, 05 Aug 2026 16:57:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrevS-00000004IpG-2MBc
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 16:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785949024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAgw3PrEuDhOIcKtb6+8ldw2d+fWENAJGYFojVd12Y4=;
	b=KDQvtPnuNEWyz+XNQUpblG9oQEVfGuOErOXdSiq3B6t4uws5w3h0qk7RQjfvnNhkvk4BUY
	nb/shrpOktixi10pq9EoWl98/aM4LVd0eFTwQjZ8Q3VpW7MkVXqzCGdJ4Zc+R2jFyj/OYG
	kejg7po+gfItnD2OpYGZObKI+uilTJY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-Zepc4MqQO4S6IHC64GKc-A-1; Wed, 05 Aug 2026 12:57:01 -0400
X-MC-Unique: Zepc4MqQO4S6IHC64GKc-A-1
X-Mimecast-MFC-AGG-ID: Zepc4MqQO4S6IHC64GKc-A_1785949020
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-472a798fc7cso782974f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Aug 2026 09:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785949020; x=1786553820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAgw3PrEuDhOIcKtb6+8ldw2d+fWENAJGYFojVd12Y4=;
        b=q5kg7/gn+Si+CfT2WLxH51lksrGdDsm/tJCDQSCVyl8/NZ7EVSgEZ99LeY/GsMjr8z
         P/QDFY9l/PnzB4k8uoR0njmZQyN3mW2boCkHBWjc/8FCqoiQhPsmachKxzKd9s7VLuiy
         EXv9cEU956XmHlo30+IRHLnmbBHrIIJOwor5h4PiSh8+G+PypZu0t7NdgKTpSERGHI5a
         xPYjv1MwxuDQygw1B35073Fw+NAQSieC96BsrgLpeDmTDjJcF5VutJi8yss5EOeFfZVr
         FNNmzS1LPSjYh4zlWojir2i0n8vwR7HUXNV8kbmW2Z4bZ0DfOeokPUUdKXr21voCyzEW
         AdTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv1SRkyyuLwTry5DdzkD9G6VyuP9Ha3A+Fz4pBaXpcyNQrluizn2u9rJxhaPwZy08JZYR3sK/wdXh/WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDnVOPXeTtphAc5hpbvBR3T9AMf+S/IaO7SSSIHxVUd9pSZvgP
	gnPgSQswMNCJlxVKkS7fmwqKCFXqdr6gvmAN5vlWUiS4x/OmAP32KCvGkIx4M2l5K0VzjoCCOb6
	JcKSMaEpr96htI4QQ1L4EKyx1+nzdKDaZWGYVbO4T6xEr8SAldOg6mhE8GLTmRX1ldMjD/F2+A3
	zQypBUnko47fXu5xuWQPqY35TzaK1r8HXRqSknLzebdfwy
X-Gm-Gg: AR+sD12NyqPzKVIpqZPnj/EAr372qLmF2FSsYETdsMHPdo0L69nk9a5GcaXaWRZfFtL
	QmkSUzw1p4kObBO0Rb3gmWoqnsDZoORI2IMJSOxMKYndh5mgN0fGlN2e2v+yEDFIPuzTGnsovjn
	QXWt6+THfrPdAWY97GRwpGezF7ILxp0RC2w69v0m7tjea5gIx1azffqXaBEeJOHeAieqkdq/LtV
	o4Ud9XkSkbD9+V1uQ==
X-Received: by 2002:a05:6000:29c2:b0:47f:cb30:8591 with SMTP id ffacd0b85a97d-47fec4e712dmr11424930f8f.6.1785949019929;
        Wed, 05 Aug 2026 09:56:59 -0700 (PDT)
X-Received: by 2002:a05:6000:29c2:b0:47f:cb30:8591 with SMTP id
 ffacd0b85a97d-47fec4e712dmr11424885f8f.6.1785949019593; Wed, 05 Aug 2026
 09:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260725001614.2578617-1-tchiu@tenstorrent.com> <20260725001614.2578617-2-tchiu@tenstorrent.com>
In-Reply-To: <20260725001614.2578617-2-tchiu@tenstorrent.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Wed, 5 Aug 2026 12:56:48 -0400
X-Gm-Features: AUfX_myI5gZf_5IKYX9ww3cqa7gSzPo8bBFph93c4T8Og62vCTWLW3ZRVqEnrTk
Message-ID: <CADRr4bft5RDmZYjeWN2m7y0O6iF2WS5ZbJXhdKhKV5NTyPL3NA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: hwprobe: initialize pair->value in hwprobe_one_pair()
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Evan Green <evan@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org, 
	bergner@tenstorrent.com, kito.cheng@sifive.com, dfustini@oss.tenstorrent.com, 
	greentime.hu@sifive.com, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Deepak Gupta <debug@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>, Jingwei Wang <wangjingwei@iscas.ac.cn>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7fp9-rDorFnoFo5YCyHXzIqKo_7eEyZ7gChpX37f7NY_1785949020
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_095706_679060_A5D29140 
X-CRM114-Status: GOOD (  19.22  )
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

T24gRnJpLCBKdWwgMjQsIDIwMjYgYXQgOToxNOKAr1BNIEFuZHkgQ2hpdSA8dGNoaXVAdGVuc3Rv
cnJlbnQuY29tPiB3cm90ZToKPgo+IFRoZSB2ZW5kb3ItZXh0ZW5zaW9uIGhhbmRsZXJzIHJlYWNo
ZWQgZnJvbSBod3Byb2JlX29uZV9wYWlyKCkKPiAoaHdwcm9iZV9pc2FfdmVuZG9yX2V4dF90aGVh
ZF8wKCkgYW5kIGZyaWVuZHMpIG9ubHkgT1IgdGhlIHByZXNlbnQgYml0cwo+IGludG8gcGFpci0+
dmFsdWUgdmlhIFZFTkRPUl9FWFRFTlNJT05fU1VQUE9SVEVEKCkgYW5kIGNsZWFyIHRoZWlyIG93
bgo+IG1pc3NpbmcgYml0czsgdGhleSBhc3N1bWUgdGhlIGNhbGxlciBoYXMgYWxyZWFkeSB6ZXJv
ZWQgcGFpci0+dmFsdWUuCj4KPiBUaGF0IGhvbGRzIGZvciBod3Byb2JlX2dldF92YWx1ZXMoKSAo
aXQgemVyb2VzIGVhY2ggcGFpcikgYW5kCj4gaHdwcm9iZV9nZXRfY3B1cygpIChpdCByZS1pbml0
aWFsaXplcyBpdHMgc2NyYXRjaCBwYWlyIHBlciBrZXkpLCBidXQgbm90Cj4gZm9yIGNvbXBsZXRl
X2h3cHJvYmVfdmRzb19kYXRhKCksIHdoaWNoIHJldXNlcyBhIHNpbmdsZSBwYWlyIGFjcm9zcyBh
bGwKPiBrZXlzCgpGb3IgbG9vcCBtb21lbnQgTE9MCgo+IHdpdGhvdXQgcmUtemVyb2luZy4gQSB2
ZW5kb3Iga2V5IHRoZXJlZm9yZSBpbmhlcml0cyBzdGFsZSBiaXRzIGZyb20KPiB0aGUgcHJldmlv
dXNseSBwcm9iZWQga2V5LCBhbmQgdGhlIHdyb25nIHZhbHVlIGlzIGNhY2hlZCBpbiB0aGUgdkRT
Two+IGFsbF9jcHVfaHdwcm9iZV92YWx1ZXNbXSBhbmQgaGFuZGVkIHRvIHVzZXJzcGFjZSBvbiB0
aGUgZmFzdCBwYXRpaC4KPgo+IFplcm8gcGFpci0+dmFsdWUgb25jZSBhdCB0aGUgdG9wIG9mIGh3
cHJvYmVfb25lX3BhaXIoKSBzbyBldmVyeSBoYW5kbGVyCj4gc3RhcnRzIGZyb20gYSBjbGVhbiB2
YWx1ZSByZWdhcmRsZXNzIG9mIHRoZSBjYWxsZXIsIGFuZCBkcm9wIHRoZSBub3cKPiByZWR1bmRh
bnQgemVyb2luZyBpbiB0aGUgKl9CTE9DS19TSVpFIGNhc2VzLiBod3Byb2JlX2lzYV9leHQwKCkg
a2VlcHMgaXRzCj4gb3duIHplcm9pbmcgYmVjYXVzZSBod3Byb2JlX2V4dDBfaGFzKCkgY2FsbHMg
aXQgZGlyZWN0bHksIGJ5cGFzc2luZwo+IGh3cHJvYmVfb25lX3BhaXIoKS4KPgo+IEZpeGVzOiBh
NWVhNTNkYTY1YzUgKCJyaXNjdjogaHdwcm9iZTogQWRkIHRoZWFkIHZlbmRvciBleHRlbnNpb24g
cHJvYmluZyIpCj4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDx0Y2hpdUB0ZW5zdG9ycmVudC5j
b20+CgogUmV2aWV3ZWQtYnk6IEplc3NlIFRhdWJlIDxqdGF1YmVwZUByZWRoYXQuY29tPgoKCj4g
LS0tCj4gQ2hhbmdlbG9nIHYzOgo+ICAtIG5ldyBwYXRjaCBzaW5jZSB2Mwo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIHwgNSArKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
Cj4gaW5kZXggY2FmNjc2MjQyN2M4Li5kMmJiNzBmZWQ4YjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMKPiBAQCAtMjk1LDYgKzI5NSw4IEBAIHN0YXRpYyB1NjQgaHdwcm9iZV92ZWNfbWlz
YWxpZ25lZChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cykKPiAgc3RhdGljIHZvaWQgaHdwcm9i
ZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzKQo+ICB7Cj4gKyAgICAgICBw
YWlyLT52YWx1ZSA9IDA7Cj4gKwo+ICAgICAgICAgc3dpdGNoIChwYWlyLT5rZXkpIHsKPiAgICAg
ICAgIGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfTVZFTkRPUklEOgo+ICAgICAgICAgY2FzZSBSSVND
Vl9IV1BST0JFX0tFWV9NQVJDSElEOgo+IEBAIC0zMjksMTcgKzMzMSwxNCBAQCBzdGF0aWMgdm9p
ZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPgo+ICAgICAgICAgY2FzZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pf
QkxPQ0tfU0laRToKPiAtICAgICAgICAgICAgICAgcGFpci0+dmFsdWUgPSAwOwo+ICAgICAgICAg
ICAgICAgICBpZiAoaHdwcm9iZV9leHQwX2hhcyhjcHVzLCBSSVNDVl9IV1BST0JFX0VYVF9aSUNC
T1opKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBhaXItPnZhbHVlID0gcmlzY3ZfY2Jvel9i
bG9ja19zaXplOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgUklTQ1Zf
SFdQUk9CRV9LRVlfWklDQk9NX0JMT0NLX1NJWkU6Cj4gLSAgICAgICAgICAgICAgIHBhaXItPnZh
bHVlID0gMDsKPiAgICAgICAgICAgICAgICAgaWYgKGh3cHJvYmVfZXh0MF9oYXMoY3B1cywgUklT
Q1ZfSFdQUk9CRV9FWFRfWklDQk9NKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52
YWx1ZSA9IHJpc2N2X2Nib21fYmxvY2tfc2l6ZTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPUF9CTE9DS19TSVpFOgo+IC0gICAg
ICAgICAgICAgICBwYWlyLT52YWx1ZSA9IDA7Cj4gICAgICAgICAgICAgICAgIGlmIChod3Byb2Jl
X2V4dDBfaGFzKGNwdXMsIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPUCkpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcGFpci0+dmFsdWUgPSByaXNjdl9jYm9wX2Jsb2NrX3NpemU7Cj4gICAgICAg
ICAgICAgICAgIGJyZWFrOwo+IC0tCj4gMi40My4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
