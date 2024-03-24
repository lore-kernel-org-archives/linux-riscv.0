Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B508EC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 18:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpGEYsMoHv8JPwt6Vvju90bUtNyhvTLKGWL1faUw0bA=; b=m3JbuFUlOUBsVK
	w9eS0Q9y/W879Y2nD3d+meArsuvZEvHUEY5KnqOWDa38wvtYRBy7N8fDrh5S5C1mXIF7IwTpl/jQl
	pXhGFA2rejzVI8cvqkFN9e1+dgovqjqddRRr+bs/KcXtnKZ12Ld//O5mCcaX83dS1+6itbyvc12o7
	42RZIXaeEo9dXgzP443v6XScdL4E8AcuZwMaktGGC7CENjc58cjrw1rGER9kXnHZvTYxwmJjRyqrv
	U47mbH8Q5HCy7dAHWnzPe/r4JUChURiAmGbRW4Rtog+NiQxkEqud13+25moJ6deOtbpX+Q6zRhUvY
	I86n8217czaAUg3AvcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roSlp-0000000DDaH-3EGO;
	Sun, 24 Mar 2024 18:40:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roSln-0000000DDZp-0lSz
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 18:40:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-341b9f6fb2eso1457278f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2024 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711305632; x=1711910432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJKbpIBc4Yk3hVeaC0TWE3PUYRF5GQ/zo/JVhWXgRF4=;
        b=N2CIo64vIY6UWJJ8NQz5/AtmN0ZQsvIRhWJfxycVO9blfbCzNOtD0yQM24gLBeM+E6
         VrNxVbRcINY3bag/2QhL42jZgM4Fzuhv+ps02Mw51NYs45C6UL+I80kbY/kSN/61Xylz
         BJKvuMLEIyJOKaLDa2kmcCb9qjn84r7NoWulDCpT6zAVctsuuI/rnqM2l9XXd4PCIJRk
         3i+VwIhrGK2VSXB8CYZW9l1sna01qhmeL7O5gqV2ZVmKrB9Sd/bvIL8I5BLdGPLS+0oC
         m+OtQOTTSXZqFAolLntp1ZrH1vFM4IeG3h4q0DHsdbecPMGNTNmbaAg0lshGoO4eh9O/
         yccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711305632; x=1711910432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJKbpIBc4Yk3hVeaC0TWE3PUYRF5GQ/zo/JVhWXgRF4=;
        b=vLeuyHiochRhwFQoOOw8YD8oVaQmqqEIcFOrSP0G4zxB9k5kYHLtPeDcgr0TtFtC8o
         DI8nqKXhgkyF3V4HoY22ORfhVTJMU3W7NPXrDOq/08jJOfc1/Bzx5iR6pKa5gJTHR0cX
         N1I1pOKsBtDVkC17cL40v7ic112FskyXWcIFXQXxXu0tjm1AE5bJ8T4zhIzUwmuNtrde
         y74rUBISXns6DOTJNcpFUCKwuP61/QdOBhWqk4Qm6OOVWXHDaJpi8wqo7JsiH/jfIWKf
         2W3r9SPjbca62Sn5k/Ueg9cYHIeX4XlXveqCWZpW23ppp4oWOTWUKzeRDB3KyvIAVS4s
         QsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdeb/zaPoBGyPO95sD6wBBjv2zxErdx53P0mFGVvLZMzgNFClfv1BQ0Fq71xoXTPJlNeuizW7VgcbcUxzpFtfOs29CdIqclkTVtd6eNCD0
X-Gm-Message-State: AOJu0Yx4QSoyno0eF75ymtdGyZ0fokC1lyYtAGnQ4lVIUffBlXwDQYPX
	m/RTyv8L9cfsTT7acIqYEcMWtNT1BnreX3LKPGjECZLBPDY+8nacWJ0McPA9FerWFHvajeGeRxm
	EaB/YrsIn9DGxKe0WQBshtfRxb0g=
X-Google-Smtp-Source: AGHT+IFzKEkY15yhx27Y6RGVrqzcqiPDvwvdtOsJddWLuUBEN2lntnvbXLjYRQxGyEL3NiLUINN58t818qvcHl3O+OI=
X-Received: by 2002:a05:6000:4593:b0:33e:d547:4318 with SMTP id
 gb19-20020a056000459300b0033ed5474318mr3801146wrb.47.1711305632179; Sun, 24
 Mar 2024 11:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240324103306.2202954-1-pulehui@huaweicloud.com>
In-Reply-To: <20240324103306.2202954-1-pulehui@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 24 Mar 2024 11:40:20 -0700
Message-ID: <CAADnVQLhfN7f6AFxa_19E0g2_YADEkrfPPffi43HeH9VCi8MqQ@mail.gmail.com>
Subject: Re: [PATCH bpf] riscv, bpf: Fix kfunc parameters incompatibility
 between bpf and riscv abi
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Network Development <netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_114035_253035_A446BACD 
X-CRM114-Status: GOOD (  24.93  )
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

T24gU3VuLCBNYXIgMjQsIDIwMjQgYXQgMzozMuKAr0FNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gV2UgZW5jb3VudGVyZWQgYSBmYWlsaW5nIGNhc2Ugd2hlbiBydW5uaW5nIHNlbGZ0ZXN0
IGluIG5vX2FsdTMyIG1vZGU6Cj4KPiBUaGUgZmFpbHVyZSBjYXNlIGlzIGBrZnVuY19jYWxsL2tm
dW5jX2NhbGxfdGVzdDRgIGFuZCBpdHMgc291cmNlIGNvZGUgaXMKPiBsaWtlIGJlbGxvdzoKPiBg
YGAKPiBsb25nIGJwZl9rZnVuY19jYWxsX3Rlc3Q0KHNpZ25lZCBjaGFyIGEsIHNob3J0IGIsIGlu
dCBjLCBsb25nIGQpIF9fa3N5bTsKPiBpbnQga2Z1bmNfY2FsbF90ZXN0NChzdHJ1Y3QgX19za19i
dWZmICpza2IpCj4gewo+ICAgICAgICAgLi4uCj4gICAgICAgICB0bXAgPSBicGZfa2Z1bmNfY2Fs
bF90ZXN0NCgtMywgLTMwLCAtMjAwLCAtMTAwMCk7Cj4gICAgICAgICAuLi4KPiB9Cj4gYGBgCj4K
PiBBbmQgaXRzIGNvcnJlc3BvbmRpbmcgYXNtIGNvZGUgaXM6Cj4gYGBgCj4gMDogcjEgPSAtMwo+
IDE6IHIyID0gLTMwCj4gMjogcjMgPSAweGZmZmZmZjM4ICMgb3Bjb2RlOiAxOCAwMyAwMCAwMCAz
OCBmZiBmZiBmZiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMAo+IDQ6IHI0ID0gLTEwMDAKPiA1OiBj
YWxsIGJwZl9rZnVuY19jYWxsX3Rlc3Q0Cj4gYGBgCj4KPiBpbnNuIDIgaXMgcGFyc2VkIHRvIGxk
X2ltbTY0IGluc24gdG8gZW1pdCAweDAwMDAwMDAwZmZmZmZmMzggaW1tLCBhbmQKPiBjb252ZXJ0
ZWQgdG8gaW50IHR5cGUgYW5kIHRoZW4gc2VuZCB0byBicGZfa2Z1bmNfY2FsbF90ZXN0NC4gQnV0
IHNpbmNlCj4gaXQgaXMgemVyby1leHRlbmRlZCBpbiB0aGUgYnBmIGNhbGxpbmcgY29udmVudGlv
biwgcmlzY3Ygaml0IHdpbGwKPiBkaXJlY3RseSB0cmVhdCBpdCBhcyBhbiB1bnNpZ25lZCAzMi1i
aXQgaW50IHZhbHVlLCBhbmQgdGhlbiBmYWlscyB3aXRoCj4gdGhlIG1lc3NhZ2UgImFjdHVhbCA0
Mjk0OTY2MDYzICE9IGV4cGVjdGVkIC0xMjM0Ii4KPgo+IFRoZSByZWFzb24gaXMgdGhlIGluY29t
cGF0aWJpbGl0eSBiZXR3ZWVuIGJwZiBhbmQgcmlzY3YgYWJpLCB0aGF0IGlzLAo+IGJwZiB3aWxs
IGRvIHplcm8tZXh0ZW5zaW9uIG9uIHVpbnQsIGJ1dCByaXNjdjY0IHJlcXVpcmVzIHNpZ24tZXh0
ZW5zaW9uCj4gb24gaW50IG9yIHVpbnQuIFdlIGNhbiBzb2x2ZSB0aGlzIHByb2JsZW0gYnkgc2ln
biBleHRlbmRpbmcgdGhlIDMyLWJpdAo+IHBhcmFtZXRlcnMgaW4ga2Z1bmMuCj4KPiBUaGUgaXNz
dWUgaXMgcmVsYXRlZCB0byBbMF0sIGFuZCB0aGFua3MgdG8gWW9uZ2hvbmcgYW5kIEFsZXhlaS4K
Pgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9wdWxsLzg0ODc0
IFswXQo+IEZpeGVzOiBkNDBjMzg0N2I0ODUgKCJyaXNjdiwgYnBmOiBBZGQga2Z1bmMgc3VwcG9y
dCBmb3IgUlY2NCIpCj4gU2lnbmVkLW9mZi1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNv
bT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDE2ICsrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYwo+IGluZGV4IDg2OWU0MjgyYTJjNC4uZTNmYzM5MzcwZjdkIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiArKysgYi9hcmNoL3Jpc2N2
L25ldC9icGZfaml0X2NvbXA2NC5jCj4gQEAgLTE0NTQsNiArMTQ1NCwyMiBAQCBpbnQgYnBmX2pp
dF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNuLCBzdHJ1Y3QgcnZfaml0X2Nv
bnRleHQgKmN0eCwKPiAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICsgICAgICAgICAgICAgICBpZiAoaW5zbi0+c3Jj
X3JlZyA9PSBCUEZfUFNFVURPX0tGVU5DX0NBTEwpIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgKmZtOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGludCBpZHg7Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZtID0gYnBmX2ppdF9m
aW5kX2tmdW5jX21vZGVsKGN0eC0+cHJvZywgaW5zbik7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKCFmbSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlO
VkFMOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGlkeCA9IDA7IGlkeCA8IGZt
LT5ucl9hcmdzOyBpZHgrKykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTgg
cmVnID0gYnBmX3RvX3J2X3JlZyhCUEZfUkVHXzEgKyBpZHgsIGN0eCk7Cj4gKwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGZtLT5hcmdfc2l6ZVtpZHhdID09IHNpemVvZihp
bnQpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbWl0X3NleHR3
KHJlZywgcmVnLCBjdHgpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAg
ICAgICAgfQo+ICsKClRoZSBidGZfZnVuY19tb2RlbCB1c2FnZSBsb29rcyBnb29kLgpHbGFkIHRo
YXQgbm8gbmV3IGZsYWdzIHdlcmUgbmVjZXNzYXJ5LCBzaW5jZSBib3RoIGludCBhbmQgdWludApu
ZWVkIHRvIGJlIHNpZ24gZXh0ZW5kIHRoZSBleGlzdGluZyBhcmdfc2l6ZSB3YXMgZW5vdWdoLgoK
U2luY2Ugd2UncmUgYXQgaXQuIERvIHdlIG5lZWQgdG8gZG8gemVybyBleHRlbnNpb24gb2YgcmV0
dXJuIHZhbHVlID8KVGhlcmUgaXMKX19icGZfa2Z1bmMgaW50IGJwZl9rZnVuY19jYWxsX3Rlc3Qy
KHN0cnVjdCBzb2NrICpzaywgdTMyIGEsIHUzMiBiKQpidXQgdGhlIHNlbGZ0ZXN0IHdpdGggaXQg
aXMgdG9vIHNpbXBsZToKICAgICAgICByZXR1cm4gYnBmX2tmdW5jX2NhbGxfdGVzdDIoKHN0cnVj
dCBzb2NrICopc2ssIDEsIDIpOwoKQ291bGQgeW91IGV4dGVuZCB0aGlzIHNlbGZ0ZXN0IHdpdGgg
YSByZXR1cm4gb2YgbGFyZ2UgaW50L3VpbnQKd2l0aCAzMXRoIGJpdCBzZXQgdG8gZm9yY2Ugc2ln
biBleHRlbnNpb24gaW4gbmF0aXZlCmtlcm5lbCByaXNjLXYgY29kZSA/Ckkgc3VzcGVjdCB0aGUg
YnBmIHNpZGUgd2lsbCBiZSBjb25mdXNlZC4KV2hpY2ggd291bGQgbWVhbiB0aGF0IHJpc2MtdiBK
SVQgaW4gYWRkaXRpb24gdG86CiAgICAgICAgaWYgKGluc24tPnNyY19yZWcgIT0gQlBGX1BTRVVE
T19DQUxMKQogICAgICAgICAgICBlbWl0X212KGJwZl90b19ydl9yZWcoQlBGX1JFR18wLCBjdHgp
LCBSVl9SRUdfQTAsIGN0eCk7CgpuZWVkIHRvIGNvbmRpdGlvbmFsbHkgZG86CiBpZiAoZm0tPnJl
dF9zaXplID09IHNpemVvZihpbnQpKQogICBlbWl0X3pleHR3KGJwZl90b19ydl9yZWcoQlBGX1JF
R18wLCBjdHgpLAogICAgICAgICAgICAgIGJwZl90b19ydl9yZWcoQlBGX1JFR18wLCBjdHgpLCBj
dHgpOwo/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
