Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E3DC3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrnfwZr5QvJ3sERD0neWkQzF/rucu9q6+NlwtZYUDVo=; b=J3BrItxkRJ8ZGC
	05/uo0KC2vGfFRLSkjBZvNMtmyO1Hluk9S1yxfDIHRZIDTdRmJCvjPHs2knFw0PTNhBPtEr49c9vh
	dHNE+pc3aplUQsmLvwP8AoMkqTUQ8CNlfATawpsj2/RXNn0iraxpnM9RH3QoJ8cdd+5DhqlBOnaNv
	Q4yF3tmXzI3HaqGhgF1/kkkTbACENVSWij0vEXeo0lt4XqHId6lb9CgERvRAYA3cND3+ZOiLvr2gt
	xx/rS7i7hZribYCLV6YvV/l4ao6R/WTh3muj6+N/PbaPiwcQG7cxS7hEu3tAm8ZZy9pRLt//RcsCO
	pXx6mGFmzbykNwcHncSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZH0q-003kVL-0x;
	Thu, 24 Aug 2023 20:33:04 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZH0n-003kUX-10
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 20:33:03 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-791b8525b59so95932241.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 13:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692909174; x=1693513974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHgc3WP+Nh6Vx2D3nfsqbnX7Tv1DqoV0JUg0NhhaZj0=;
        b=yUSsrWXewLlVITH1WXfUdKTdRJucx44NluTkLK1hKUN7MOAOoeNAxg0GbiBkppLBqw
         2SSw7fRty8PZ4jahXDUgvCq6mHGME3/pusrnlWgJBQyOLKpyGrwtNZ76eo8bzd4gEbps
         yRsgzQ8KQjJ/SYrfq4tsGNfmnB+XT/f61OeeP2a91WwQmxDzHRf5reDG0dTf5yreKwOP
         YkPC563nZqNgtMUZ6rDBIU3zgrCfc4DRcSVZJC+mjhLctJcnN6fh+yCgPrn8OqJW//CO
         J1fTP929LHNCV/PLeEV0dYOaVChPytLLrG7ZW53zcO8+NggVhA0Ci2pCr05ZYWWLt7Gj
         Y3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692909174; x=1693513974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHgc3WP+Nh6Vx2D3nfsqbnX7Tv1DqoV0JUg0NhhaZj0=;
        b=Or2W/s2g2BbbpSDy2BifnzmOfiG926hlhWxUaZ1QPXPXdugZBy7pokBkDfqhAGOpVi
         m5WSJNruqOR2BMYvD6FjiZnp4yeGffKPK1ORwjnDFgOQ9fqXI8o701fwESxFt0GO/sxH
         AZ73HcCdBtpFS1409GzX2b1VfYAse20ADqqkpoQ0YHU0P7emP9++VW9Q9HDXCbYuNmEg
         nAAGGHYdiEZyCa8dd2e45j0ZW5Cz1Cq0WjVKlnaY8kBsVKf0vHpL7/nPpyYDh7Z4LlTC
         +v3LEdus7ZTyDf5bAB/N+7BLinUngacmiw15tiHMbrKfaxbzGrYgTn9QQUcvAO19IpU3
         80yA==
X-Gm-Message-State: AOJu0Yz8G0/anfhSklNHF8S8v36QZ3LNWQulQFu31cwolk4yL9nV1U01
	87pbpKO5134SaZ/sQpJpUxJQttL4PwHu+WbIhGsWEQ==
X-Google-Smtp-Source: AGHT+IHx+HdR8IQ8OXZN+MAUVyWyXJ/kKMpdKNVgDgofuFkKOBodmgQtn3uFU6QlecscjQN2j2BzMPtDM26C8djqy14=
X-Received: by 2002:a05:6102:2d3:b0:44d:3f58:c42f with SMTP id
 h19-20020a05610202d300b0044d3f58c42fmr13443054vsh.11.1692909173739; Thu, 24
 Aug 2023 13:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
In-Reply-To: <20230824184910.GA2015748@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 24 Aug 2023 13:32:42 -0700
Message-ID: <CAKwvOdkdb=dDggNNPHb08AiZNp5V-H9utgm0H+2hJmZJdO-biA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Tom Rix <trix@redhat.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_133301_347412_BCB75616 
X-CRM114-Status: GOOD (  34.42  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTE6NDnigK9BTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTE6MDM6
MTdBTSAtMDcwMCwgbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20gd3JvdGU6Cj4gPiBMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xOTA3IFswXQo+ID4g
LS0tCj4gPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxu
aWVyc0Bnb29nbGUuY29tPgo+Cj4gTml0OiBZb3VyIHNpZ25lZC1vZmYtYnkgZW5kZWQgdXAgYmVs
b3cgdGhlIGZvbGQsIHdhcyBpdCBpbiB5b3VyIGNvdmVyCj4gbGV0dGVyIGNvbW1pdCByYXRoZXIg
dGhhbiB5b3VyIGFjdHVhbCBjb21taXQ/CgpIZWgsIG5vLiBJJ20gcmVzdG9yaW5nIGEgbWFjaGlu
ZSBhZnRlciBzdWZmZXJpbmcgZHJpdmUgY29ycnVwdGlvbiBsYXN0CndlZWsuIEkganVzdCBnb3Qg
cGF0YXR0IGFuZCBmcmllbmRzIHJlLXNldCB1cCwgYnV0IEkgZm9yZ290IHRvIGBnaXQKY29tbWl0
IC0tYW1lbmQgLXNgIGZvciB0aGlzIHBhdGNoIG9uY2UgZXZlcnl0aGluZyB3YXMgd29ya2luZyBh
Z2Fpbi4KVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzIQoKPgo+IEFzaWRlIGZyb20gdGhlIHJlbGF0
aXZlbHkgbWlub3IgY29tbWVudHMgYmVsb3csIHRoaXMgbG9va3MgbGlrZSBhIHJlYWxseQo+IGdv
b2QgaW1wcm92ZW1lbnQgdG8gdGhlIGRvY3VtZW50YXRpb24gdG8gbWUuIEl0IGZlZWxzIGxpa2Ug
aXQgaXMgbW9yZQo+IHRhcmdldGluZyB1c2VycyBvciBub24ta2J1aWxkIGZvbGtzIG5vdywgd2hp
Y2ggSSB0aGluayBpcyBncmVhdC4KPgo+IEkgdHJ1c3QgeW91IHRvIGFkZHJlc3MgbXkgY29tbWVu
dHMgYXMgeW91IHNlZSBmaXQsIHNvIHBsZWFzZSBjYXJyeQo+IGZvcndhcmQ6Cj4KPiBSZXZpZXdl
ZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgoKVGhhbmtzIGZvciB0
aGUgcmV2aWV3IQoKPiBJIHNlZSBhIGZldyBuZXcga2VybmVsLWRvYyB3YXJuaW5ncyBmcm9tIG5v
dCBhZGp1c3RpbmcgdGhlIHVuZGVybGluZXMgdG8KPiBtYXRjaCB0aGUgbmV3IGxlbmd0aCBvZiB0
aGUgdGl0bGU6Cj4KPiAgIERvY3VtZW50YXRpb24va2J1aWxkL2xsdm0ucnN0OjQwOiBXQVJOSU5H
OiBUaXRsZSB1bmRlcmxpbmUgdG9vIHNob3J0Lgo+Cj4gICBUaGUgTExWTT0gYXJndW1lbnQKPiAg
IC0tLS0tLS0tLS0tLS0tCj4gICBEb2N1bWVudGF0aW9uL2tidWlsZC9sbHZtLnJzdDo0MDogV0FS
TklORzogVGl0bGUgdW5kZXJsaW5lIHRvbyBzaG9ydC4KPgo+ICAgVGhlIExMVk09IGFyZ3VtZW50
Cj4gICAtLS0tLS0tLS0tLS0tLQo+ICAgRG9jdW1lbnRhdGlvbi9rYnVpbGQvbGx2bS5yc3Q6MTAy
OiBXQVJOSU5HOiBUaXRsZSB1bmRlcmxpbmUgdG9vIHNob3J0Lgo+Cj4gICBUaGUgTExWTV9JQVM9
IGFyZ3VtZW50Cj4gICAtLS0tLS0tLS0tLS0tLS0tLQo+ICAgRG9jdW1lbnRhdGlvbi9rYnVpbGQv
bGx2bS5yc3Q6MTAyOiBXQVJOSU5HOiBUaXRsZSB1bmRlcmxpbmUgdG9vIHNob3J0Lgo+Cj4gICBU
aGUgTExWTV9JQVM9IGFyZ3VtZW50Cj4gICAtLS0tLS0tLS0tLS0tLS0tLQoKb29wcyEgcmVtaW5k
IG1lIG9mIHRoZSBtYWtlIHRhcmdldCB0byBvYnNlcnZlIHRoZXNlPwoKPiA+IC1Gb3IgZXhhbXBs
ZSwgdG8gY3Jvc3MtY29tcGlsZSB0aGUgYXJtNjQga2VybmVsOjoKPiA+ICsgICAgIG1ha2UgTExW
TT0xIExEPWxkLmJmZCBDUk9TU19DT01QSUxFPXMzOTB4LWxpbnV4LWdudS0KPgo+IFRoaXMgc2hv
dWxkIHByb2JhYmx5IGhhdmUgQVJDSD1zMzkwPwoKT29wcyEgR29vZCBjYXRjaCEKCj4KPiA+IC0g
ICAgIG1ha2UgQVJDSD1hcm02NCBMTFZNPTEKPiA+ICtgYENST1NTX0NPTVBJTEVgYCBpcyBub3Qg
dXNlZCB0byBwcmVmaXggdGhlIENsYW5nIGNvbXBpbGVyIGJpbmFyeSAob3IKPiA+ICtjb3JyZXNw
b25kaW5nIExMVk0gdXRpbGl0aWVzKSwgYnV0IGl0IHdpbGwgYmUgZm9yIGFueSBHTlUgdG9vbGNo
YWluIHV0aWxpdGllcy4KPiA+ICtUaGlzIGV4YW1wbGUgd2lsbCBpbnZva2UgYGBzMzkweC1saW51
eC1nbnUtbGQuYmZkYGAgYXMgdGhlIGxpbmtlciwgc28gZW5zdXJlCj4gPiArdGhhdCBpcyByZWFj
aGFibGUgaW4geW91ciBgYCRQQVRIYGAuCj4KPiBJIGxpa2UgdGhlIGV4YW1wbGUgYXMgSSBmZWVs
IGxpa2UgaXQgYWRkcmVzc2VzIHNvbWUgb2YgdGhlIGZlYXIgSSBoYXZlIGhhZAo+IGFyb3VuZCBy
ZWNvbW1lbmRpbmcgTExWTT0xIGFzIHRoZSBpbml0aWFsIGJ1aWxkIHN1Z2dlc3Rpb24gYnV0ICdM
TFZNPTEKPiBMRD1sZC5iZmQgQ1JPU1NfQ09NUElMRT1zMzkweC1saW51eC1nbnUtJyBkb2VzIG5v
dCBjb21wb3NlIGFzIHlvdSBkZXNjcmliZSBoZXJlCj4gYmVjYXVzZSAkKExEKSBpcyBub3QgcHJl
Zml4ZWQgd2l0aCAkKENST1NTX0NPTVBJTEUpIGFueXdoZXJlIGluIE1ha2VmaWxlLiBUaGUKPiBu
b24tJChMTFZNKSBkZWZhdWx0IGFzc2lnbm1lbnQgb2YgJChMRCkgaXMgJyQoQ1JPU1NfQ09NUElM
RSlsZCcgYW5kIHRoYXQgaXMKPiBvdmVycmlkZGVuIGJ5ICdMRD1sZC5iZmQnIG9uIHRoZSBjb21t
YW5kIGxpbmUuCj4KPiBJbiBvdGhlciB3b3JkcywgdGhpcyBzaG91bGQgYmUKPgo+ICAgbWFrZSBB
UkNIPXMzOTAgTExWTT0xIExEPXMzOTB4LWxpbnV4LWdudS1sZC5iZmQKPgo+IGFuZCBoYXZlIHRo
ZSBub3RlIGFib3V0IENST1NTX0NPTVBJTEUgcHJlZml4aW5nIGFueSBHTlUgdG9vbGNoYWluIHV0
aWxpdGllcwo+IHJlbW92ZWQuIEl0IHNob3VsZCBwcm9ibGFibHkgaGF2ZSBPQkpDT1BZIGFuZCBP
QkpEVU1QIHRvbywgYXMgdGhvc2UgYXJlCj4gcmVxdWlyZWQgZHVlIHRvIGh0dHBzOi8vZ2l0aHVi
LmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVzLzg1OSBhbmQKPiBodHRwczovL2dpdGh1
Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xNTMwLgoKQWggcmlnaHQ7IEknbSBu
byBsb25nZXIgYWJsZSB0byByZXBybyB0aGUgYnVpbGQgZmFpbHVyZSB3aXRoIE9CSkRVTVAsCnRo
b3VnaCBJIHN0aWxsIHNlZSB3YXJuaW5ncy4KCkkga2luZCBvZiBmZWVsIGxpa2Ugd2Ugc2hvdWxk
IGJyaW5nIGJhY2sgQ1JPU1NfQ09NUElMRSBpbiBzb21lIGZvcm07CmhhdmluZyB0byByZXNwZWNp
ZnkgdGhlIHRyaXBsZSBpcyBzdGlsbCBzdWItb3B0aW1hbC4KCmkuZS4gdG9kYXk6CiQgbWFrZSBM
TFZNPTEgQVJDSD1zMzkwIExEPXMzOTB4LWxpbnV4LWdudS1sZC5iZmQKT0JKQ09QWT1zMzkweC1s
aW51eC1nbnUtb2JqY29weSBPQkpEVU1QPXMzOTB4LWxpbnV4LWdudS1vYmpkdW1wCgp2cwoKJCBt
YWtlIExMVk09MSBBUkNIPXMzOTAgQ1JPU1NfQ09NUElMRT1zMzkweC1saW51eC1nbnUtIExEPWxk
LmJmZApPQkpDT1BZPW9iamNvcHkgT0JKRFVNUD1vYmpkdW1wCgpidXQgcGVyaGFwcyB0aGF0J3Mg
YSBjaGFuZ2UgZm9yIGFub3RoZXIgZGF5LgoKPgo+ID4gLUlmIGBgTExWTV9JQVM9MGBgIGlzIHNw
ZWNpZmllZCwgYGBDUk9TU19DT01QSUxFYGAgaXMgYWxzbyB1c2VkIHRvIGRlcml2ZQo+ID4gLWBg
LS1wcmVmaXg9PHBhdGg+YGAgdG8gc2VhcmNoIGZvciB0aGUgR05VIGFzc2VtYmxlciBhbmQgbGlu
a2VyLiA6Ogo+ID4gK1RoZSBMTFZNX0lBUz0gYXJndW1lbnQKPiA+ICstLS0tLS0tLS0tLS0tLS0t
LQo+ID4KPiA+IC0gICAgIG1ha2UgQVJDSD1hcm02NCBMTFZNPTEgTExWTV9JQVM9MCBDUk9TU19D
T01QSUxFPWFhcmNoNjQtbGludXgtZ251LQo+ID4gK0NsYW5nIGNhbiBhc3NlbWJsZSBhc3NlbWJs
ZXIgY29kZS4gWW91IGNhbiBwYXNzIGBgTExWTV9JQVM9MGBgIHRvIGRpc2FibGUgdGhpcwo+ID4g
K2JlaGF2aW9yIGFuZCBoYXZlIENsYW5nIGludm9rZSB0aGUgc3lzdGVtIGFzc2VtYmxlciBpbnN0
ZWFkIChvciB0aGUgYXNzZW1ibGVyCj4gPiArYmFzZWQgb24gYGBDUk9TU19DT01QSUxFYGApLiBg
YENST1NTX0NPTVBJTEVgYCBpcyBuZWNlc3Nhcnkgd2hlbiBgYExMVk1fSUFTPTBgYAo+ID4gK2lz
IHNldCB3aGVuIGNyb3NzIGNvbXBpbGluZyBpbiBvcmRlciB0byBzZXQgYGAtLXByZWZpeD1gYCBm
b3IgdGhlIGNvbXBpbGVyIHRvCj4gPiArZmluZCB0aGUgY29ycmVzcG9uZGluZyBub24taW50ZWdy
YXRlZCBhc3NlbWJsZXIuCj4KPiBUaGFua3MgYSBsb3QgZm9yIGRvY3VtZW50aW5nIHRoaXMgYmVo
YXZpb3IsIGl0IGlzIG9uZSBvZiB0aGUgbW9zdCBjb21tb24KPiBpc3N1ZXMgSSBydW4gaW50byBt
eXNlbGYgKGFkZGluZyBMTFZNX0lBUz0wIHdpdGhvdXQgQ1JPU1NfQ09NUElMRSkgYW5kCj4gbWF5
YmUgdGhpcyBub3RlIHdpbGwgYmUgd2hhdCBJIG5lZWQgaW4gb3JkZXIgdG8gcmVtZW1iZXIgOikK
CkFoIHJpZ2h0LCBJJ2xsIG1ha2UgdGhhdCBjbGVhcmVyLgoKPiA+Cj4gPiAtV2UgcHJvdmlkZSBw
cmVidWlsdCBzdGFibGUgdmVyc2lvbnMgb2YgTExWTSBvbiBga2VybmVsLm9yZyA8aHR0cHM6Ly9r
ZXJuZWwub3JnL3B1Yi90b29scy9sbHZtLz5gXy4KPiA+IC1CZWxvdyBhcmUgbGlua3MgdGhhdCBt
YXkgYmUgdXNlZnVsIGZvciBidWlsZGluZyBMTFZNIGZyb20gc291cmNlIG9yIHByb2N1cmluZwo+
ID4gLWl0IHRocm91Z2ggYSBkaXN0cmlidXRpb24ncyBwYWNrYWdlIG1hbmFnZXIuCj4gPiArV2Ug
cHJvdmlkZSBwcmVidWlsdCBzdGFibGUgdmVyc2lvbnMgb2YgTExWTSBvbiBga2VybmVsLm9yZwo+
ID4gKzxodHRwczovL2tlcm5lbC5vcmcvcHViL3Rvb2xzL2xsdm0vPmBfLiBUaGVzZSBoYXZlIGJl
ZW4gb3B0aW1pemVkIHdpdGggcHJvZmlsZQo+ID4gK2RhdGEgZm9yIGJ1aWxkaW5nIExpbnV4IGtl
cm5lbHMuIEJlbG93IGFyZSBsaW5rcyB0aGF0IG1heSBiZSB1c2VmdWwgZm9yCj4KPiBNYXliZSBt
YWtlIGEgbm90ZSBvZiB3aHkgdGhpcyBtYXR0ZXJzPyAiLCB3aGljaCBzaG91bGQgbG93ZXIga2Vy
bmVsCj4gYnVpbGQgdGltZXMgY29tcGFyZWQgdG8gbm9uLW9wdGltaXplZCBMTFZNIHRvb2xjaGFp
bnMuIj8KCkFjawoKLS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
