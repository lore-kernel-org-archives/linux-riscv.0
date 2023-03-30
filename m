Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B9FC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 18:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGfU4GhOUFIcMyB/FKi53SN9UWKp4s08DVXHorBu7zk=; b=TEenfM3KQMip42
	XTaN0+HxcWaLN8zXwlPCo2M4dnbdmiHKa/EmjxLWCsGvOl+PA3nDz0XMGTtSOfW5svKYyB+bj62No
	3vEWHFgU6o4XgAUBvAU0rFm37r8vYpR/Es/T2pvK6yQdrk6KKVZfBqitna4TcoHSDyfxDxgIyGa9L
	CB0rA3r1y7Dx3ZuMvEFgex682UC1RnHscjoa7w9L8jZ8kN6pfgHpj5ueo4QKYMV42ywwYWcap15gE
	ihT+/EDtKEnZdhsI8hYFuy4KNikJWbVA+QNFNE3Ws4JyYA5HVIr5BzI5O+2LZHh6V5kyt1hd3Km/b
	DJ0uj2jaoMOreT9V/N/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phx3H-004p1Q-2m;
	Thu, 30 Mar 2023 18:31:11 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phx3E-004p0I-0P
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 18:31:09 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 20so20626164lju.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680201065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4QG32glT+tPHqBHPO/ahp4Rj/Y6Ok/1/jb66T0Ro+s=;
        b=Qh8bK7i7hfJEM+1W1rQTmIoi2XDNoN9PWIpdbxIWkpGlQUUU9eImLC7wy5nuo3DzfN
         yLLvaWPgAIxb2EyRzYunmxDmUDVS8nULxt8VddcXJEt0APRFPSyidKmu/hKICKNvyi4u
         w70DWAHUVtSFLiYo6+9irFiYZLewPu3rkShiyfKyS+reTYaazmrIR7krCkkZm6N629wC
         aVIbZztnw0jQx4DpJhnTFGeDqe1Mxs6H7EUiLFNymACzxrj/jUPeZQUCm9PG7ngfO7NI
         jhetQus9nZezECvnMgw8kySj7hwy9GGBe4MOgr8wLpaiDL0src1x8+dl9obApepTIT6R
         evhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680201065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4QG32glT+tPHqBHPO/ahp4Rj/Y6Ok/1/jb66T0Ro+s=;
        b=8GMTl1OkIJbdAUaMFy2BESKId8K1y1xhD75UiYGN4Ch1HLfj/pcxDZjZHgkJtuaINW
         KbugyR6oG8tphJu0ziVuZRCadW1mbN53uW5IYy+5mvCTXAwCpBsQvOXc0pyabNWG1Y9k
         kc69YSB1O887RN7iuZFYwJq/ox0wxpiaz9GxFfwvf8tvKOvEfjUO2l1rsFLiuywqpjdv
         ULahHcQlmivHMe8NBd2jG/vlnE1/HhWLmcumg62vO5A14jIFBzzIU9zzbzVQAaFwkjnB
         rMV0HP4AsVyP7zRNbZIJRz42YtyUCKQ3xY6HkYGpPzBaoFIpJIqP1hNBvn7lt6e/uls7
         Yi0Q==
X-Gm-Message-State: AAQBX9d5W6+EwLnusHC95ccmu34VCpec/KEVj4fqjc8gvYIMcf19hIYK
	aP4vp7Nm3bvGaLcPKBf5hAoEKjfpbQFSh8LkIVllDQ==
X-Google-Smtp-Source: AKy350ac0Ym4n+b7VsgrP64Z2yOkhqsCxyYEAUlayK34y4u4/HjIP7opTmYIxOLRCt8DA9iOPeeG7EoKst5bN4EsmnE=
X-Received: by 2002:a2e:9887:0:b0:298:72a8:c6c4 with SMTP id
 b7-20020a2e9887000000b0029872a8c6c4mr7514253ljj.9.1680201065020; Thu, 30 Mar
 2023 11:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230221190858.3159617-1-evan@rivosinc.com> <20230221190858.3159617-3-evan@rivosinc.com>
 <605fb2fd-bda2-4922-92bf-e3e416d54398@app.fastmail.com>
In-Reply-To: <605fb2fd-bda2-4922-92bf-e3e416d54398@app.fastmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 30 Mar 2023 11:30:29 -0700
Message-ID: <CALs-HstAKtvORKwRWeh97SuAuYR61aiR-3jA2_0JCZGAJXVHbg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] RISC-V: Add a syscall for HW probing
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_113108_161540_FC6C0D67 
X-CRM114-Status: GOOD (  35.90  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, "Conor.Dooley" <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Vineet Gupta <vineetg@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMjMsIDIwMjMgYXQgMjowNuKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMjEsIDIwMjMsIGF0IDIwOjA4LCBFdmFuIEdy
ZWVuIHdyb3RlOgo+ID4gV2UgZG9uJ3QgaGF2ZSBlbm91Z2ggc3BhY2UgZm9yIHRoZXNlIGFsbCBp
biBFTEZfSFdDQVB7LDJ9IGFuZCB0aGVyZSdzIG5vCj4gPiBzeXN0ZW0gY2FsbCB0aGF0IHF1aXRl
IGRvZXMgdGhpcywgc28gbGV0J3MganVzdCBwcm92aWRlIGFuIGFyY2gtc3BlY2lmaWMKPiA+IG9u
ZSB0byBwcm9iZSBmb3IgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLiAgVGhpcyBjdXJyZW50bHkganVz
dCBwcm92aWRlcwo+ID4gbXthcmNoLGltcCx2ZW5kb3J9aWQsIGJ1dCB3aXRoIHRoZSBrZXktdmFs
dWUgcGFpcnMgd2UgY2FuIHBhc3MgbW9yZSBpbgo+ID4gdGhlIGZ1dHVyZS4KPiA+Cj4gPiBDby1k
ZXZlbG9wZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPgo+IEknbSBzdGlsbCBz
a2VwdGljYWwgYWJvdXQgdGhlIG5lZWQgZm9yIGEgY3VzdG9tIHN5c2NhbGwgaW50ZXJmYWNlIGhl
cmUuCj4gSSBoYWQgbm90IGxvb2tlZCBhdCB0aGUgaW50ZXJmYWNlIHNvIGZhciwgYnV0IHRoZXJl
IGFyZSBhIGZldyB0aGluZ3MKPiB0aGF0IHN0aWNrIG91dDoKPgo+ID4gK1JJU0MtViBIYXJkd2Fy
ZSBQcm9iaW5nIEludGVyZmFjZQo+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gKwo+ID4gK1RoZSBSSVNDLVYgaGFyZHdhcmUgcHJvYmluZyBpbnRlcmZhY2UgaXMgYmFz
ZWQgYXJvdW5kIGEgc2luZ2xlCj4gPiBzeXNjYWxsLCB3aGljaAo+ID4gK2lzIGRlZmluZWQgaW4g
PGFzbS9od3Byb2JlLmg+OjoKPiA+ICsKPiA+ICsgICAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+
ID4gKyAgICAgICAgX19zNjQga2V5Owo+ID4gKyAgICAgICAgX191NjQgdmFsdWU7Cj4gPiArICAg
IH07Cj4KPiBUaGUgd2F5IHRoaXMgaXMgZGVmaW5lZCwgdGhlIGtlcm5lbCB3aWxsIGFsd2F5cyBo
YXZlIHRvIGtub3cKPiBhYm91dCB0aGUgc3BlY2lmaWMgc2V0IG9mIGZlYXR1cmVzLCBpdCBjYW4n
dCBqdXN0IGZvcndhcmQKPiB1bmtub3duIGZlYXR1cmVzIHRvIHVzZXIgc3BhY2UgYWZ0ZXIgcHJv
YmluZyB0aGVtIGZyb20gYW4KPiBhcmNoaXRlY3R1cmVkIGhhcmR3YXJlIGludGVyZmFjZSBvciBm
cm9tIERULgoKWW91J3JlIGNvcnJlY3QgdGhhdCB0aGlzIGludGVyZmFjZSB3YXNuJ3QgaW50ZW5k
ZWQgdG8gaGF2ZSB1c2VybW9kZQpjb21lIGluIHdpdGggYXVnbWVudGVkIGRhdGEgb3IgYWRkaXRp
b25hbCBrZXkvdmFsdWUgcGFpcnMuIFRoaXMgd2FzCnB1cmVseSBtZWFudCB0byBwcm92aWRlIGFj
Y2VzcyB0byB0aGUga2VybmVsJ3MgcmVwb3NpdG9yeSBvZgphcmNoaXRlY3R1cmFsIGFuZCBtaWNy
b2FyY2hpdGVjdHVyYWwgZGV0YWlscy4gSWYgdXNlcm1vZGUgd2FudHMgdG8KcHJvdmlkZSBleHRy
YSBpbmZvIGluIHRoaXMgc2FtZSBmb3JtLCBtYXliZSB0aGV5IGNvdWxkIHdyYXAgdGhpcwppbnRl
cmZhY2UuCgo+Cj4gSWYgJ2tleScgaXMganVzdCBhbiBlbnVtZXJhdGVkIHZhbHVlIHdpdGggYSBz
bWFsbCBudW1iZXIgb2YKPiBwb3NzaWJsZSB2YWx1ZXMsIEkgZG9uJ3Qgc2VlIGFueXRoaW5nIHdy
b25nIHdpdGggdXNpbmcgZWxmCj4gYXV4IGRhdGEuIEkgdW5kZXJzdGFuZCBpdCdzIGhhcmQgdG8g
a25vdyBob3cgbWFueSBrZXlzCj4gbWlnaHQgYmUgbmVlZGVkIGluIHRoZSBsb25nIHJ1biwgZnJv
bSB0aGUgd2F5IHlvdSBkZWZpbmUKPiB0aGUga2V5L3ZhbHVlIHBhaXJzIGhlcmUsIEkgd291bGQg
ZXhwZWN0IGl0IHRvIGhhdmUgYSBsb3QKPiBvZiB0aGUgc2FtZSBsaW1pdGF0aW9ucyB0aGF0IHRo
ZSBhdXggZGF0YSBoYXMsIGV4Y2VwdCBmb3IKPiBhIGZldyBieXRlcyB0byBiZSBjb3BpZWQuCgpD
b3JyZWN0LCB0aGlzIG1ha2VzIGFsbG9jYXRpbmcgYml0cyBvdXQgb2YgaGVyZSBjaGVhcGVyIGJ5
IG5vdApyZXF1aXJpbmcgdGhhdCB3ZSBhY3RpdmVseSBjb3B5IHRoZW0gaW50byBldmVyeSBuZXcg
cHJvY2VzcyBmb3JldmVyLgpZb3UncmUgcmlnaHQgdGhhdCB0aGUgYXV4IHZlY3RvciB3b3VsZCB3
b3JrIGFzIHdlbGwsIGJ1dCB0aGUgdGhpbmtpbmcKYmVoaW5kIHRoaXMgc2VyaWVzIHdhcyB0aGF0
IGFuIGludGVyZmFjZSBsaWtlIHRoaXMgbWlnaHQgYmUgYmV0dGVyIGZvcgphbiBhcmNoaXRlY3R1
cmUgYXMgZXh0ZW5zaWJsZSBhcyByaXNjLXYuCgo+Cj4gPiArICAgIGxvbmcgc3lzX3Jpc2N2X2h3
cHJvYmUoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXJzLCBzaXplX3QKPiA+IHBhaXJfY291bnQs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGNwdV9jb3VudCwgY3B1X3Nl
dF90ICpjcHVzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3MpOwo+Cj4gVGhlIGNwdSBzZXQgYXJndW1lbnQgd29ycmllcyBtZSBtb3JlOiB0aGVyZSBz
aG91bGQgbmV2ZXIgYmUgYQo+IG5lZWQgdG8gb3B0aW1pemUgZm9yIGJyb2tlbiBoYXJkd2FyZSB0
aGF0IGhhcyBhbiBhc3ltbWV0cmljIHNldAo+IG9mIGZlYXR1cmVzLiBKdXN0IGxldCB0aGUga2Vy
bmVsIGZpZ3VyZSBvdXQgdGhlIG1pbmltdW0gc2V0Cj4gb2YgZmVhdHVyZXMgdGhhdCB3b3JrcyBh
Y3Jvc3MgYWxsIENQVXMgYW5kIHJlcG9ydCB0aGF0IGxpa2Ugd2UKPiBkbyB3aXRoIEhXQ0FQLiBJ
ZiB0aGVyZSBpcyBhIFNvQyB0aGF0IGlzIHNvIGJyb2tlbiB0aGF0IGl0IGhhcwo+IGltcG9ydGFu
dCBmZWF0dXJlcyBvbiBhIHN1YnNldCBvZiBjb3JlcyB0aGF0IHNvbWUgdXNlciBtaWdodAo+IGFj
dHVhbGx5IHdhbnQgdG8gcmVseSBvbiwgdGhlbiBoYXZlIHRoZW0gZ28gdGhyb3VnaCB0aGUgc2xv
dwo+IHN5c2ZzIGludGVyZmFjZSBmb3IgcHJvYmluZyB0aGUgQ1BVcyBpbmRpZHVhbGx5LCBidXQg
ZG9uJ3QgbWFrZQo+IHRoZSBicm9rZW4gY2FzZSBlYXNpZXIgYXQgdGhlIGV4cGVuc2Ugb2Ygbm9y
bWFsIHVzZXJzIHRoYXQKPiBydW4gb24gd29ya2luZyBoYXJkd2FyZS4KCkknbSBub3Qgc28gc3Vy
ZS4gV2hpbGUgSSBhZ3JlZSB3aXRoIHlvdSBmb3IgbWFqb3IgY2xhc3NlcyBvZiBmZWF0dXJlcwoo
ZWcgb25lIENQVSBoYXMgZmxvYXRpbmcgcG9pbnQgc3VwcG9ydCBidXQgYW5vdGhlciBkb2VzIG5v
dCksIEkgZXhwZWN0CnRoZXNlIGJpdHMgdG8gY29udGFpbiBtb3JlIHN1YnRsZSBkZXRhaWxzIGFz
IHdlbGwsIHdoaWNoIG1pZ2h0IHZhcnkKYWNyb3NzIGFzeW1tZXRyaWMgaW1wbGVtZW50YXRpb25z
IHdpdGhvdXQgYnJlYWtpbmcgQUJJIGNvbXBhdGliaWxpdHkKcGVyLXNlLiBNYXliZSBzb21lIHZl
bmRvciBoYXMgaW1wbGVtZW50ZWQgZXhvdGljIHZpZGVvIGRlY29kaW5nCmFjY2VsZXJhdGlvbiBp
bnN0cnVjdGlvbnMgdGhhdCBvbmx5IHdvcmsgb24gdGhlIGJpZyBjb3JlLiBPciBtYXliZSB0aGUK
YmlnIGNvcmVzIHN1cHBvcnQgdjMuMSBvZiBzb21lIGV4dGVuc2lvbiAod2hlcmUgY2VydGFpbiB0
aGluZ3MgcnVuCmZhc3RlciksIGJ1dCB0aGUgbGl0dGxlIGNvcmVzIG9ubHkgaGF2ZSB2My4wLCB3
aGVyZSBpdCdzIGEgbGl0dGxlCnNsb3dlci4gQ2VydGFpbiBhcHBzIHdvdWxkIGxpa2VseSB3YW50
IHRvIGtub3cgdGhlc2UgdGhpbmdzIHNvIHRoZXkKY2FuIGFsbG9jYXRlIHRoZWlyIHdvcmsgb3B0
aW1hbGx5IGFjcm9zcyBjb3Jlcy4KCj4KPiA+ICthc21saW5rYWdlIGxvbmcgc3lzX3Jpc2N2X2h3
cHJvYmUodWludHB0cl90LCB1aW50cHRyX3QsIHVpbnRwdHJfdCwKPiA+IHVpbnRwdHJfdCwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludHB0cl90LCB1aW50cHRyX3QpOwo+
Cj4gV2h5ICd1aW50cHRyX3QnIHJhdGhlciB0aGFuIHRoZSBjb3JyZWN0IHR5cGU/CgpGaXhlZC4K
LUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
