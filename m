Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B475EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 05:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJR7Aq4DKE9jULRtgU9+S20y0dEWu8kAtXwXqsPOcBI=; b=DVkoNKZwFTDnrA
	iqBs2YBU8jMxjx9qQF0xfjgQ6PV+ozxLtZVE9lHjTLmBz5/CYqMg7Ci8rcQx1IB8dFTIsL5FvrsOk
	XbmgtIrn6OwE2VzBFtlmi828pv5ZjZMGrxpbTf+05iU0VFel/Jvw1Xh/RG4lGkh3JJOTNvEOWKcGb
	+Hg8VARrNbAcBmHh/X2Fv8Gwb/4xtx1KSBv36B4v9vySKlxpthM0c5dlShm3CnnOcnI4mW2GMpgjw
	1vHeVIT+poJ8kPZbrla8jcUX7ahRBcaEKaa8VajbJzFUEvrtuiqaBln/3o+IphAo//rac/QnpGC60
	NUxgGj8IjM1o1hcy6Y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJoqF-0020eV-1O;
	Thu, 13 Jul 2023 05:26:15 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJoqC-0020dj-0o
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 05:26:13 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-403c8c48255so3423801cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 22:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689225969; x=1691817969;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wY6yIeUd5XkzBxHd4IVhXPW1XkMh9zkeZ+8KULrZkQQ=;
        b=qhnJNFc9Ui8w3ZntanV9x3uULKUEk3Gr1w8FQK6ywNaBqjjhHZ84BHRj+m/9CQ2T3r
         8kxUYjUrna+eGdhNFU9cr0Q9K4OFicGwuPEN5eWCLdGoxAU4b+8YRGlty0iqYswmyVHU
         +xCYkQwgaHIvqamfG7JVhESHM45XU/a95Inqp7f4p+R1SOnxe6Dlas6XPlySwW89xjrR
         kv5AdE5picQObmafQ6vGg0p/3e5NJcFk82cCmbvQDRQWAbQ9Md8jSv4j/JhwdHCAMY/L
         UMdNzfqghGKNA+l05uY+A/pNPyYP0tYF1VynCc6GKRUwpRb4g6ywO14FFXhHL1YEghYr
         //ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689225969; x=1691817969;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wY6yIeUd5XkzBxHd4IVhXPW1XkMh9zkeZ+8KULrZkQQ=;
        b=fvMX5e5VWQQyYL+x6iV7IiJS7eRyjqp1kdQNNWMAmlX1FrXqJu9NzHCqAdq85FrE2F
         FfSwVD7phDyGrild/KONAyTT0jAybnNyEQJt4Ra9kbApnuw3Fi9sLwo+yEDJOvDD/mM4
         YmSh5R+6UVL06hOz9fkLrtDfROuT9gB2hMBjvO4GzJ+T6fjIiWshGqsS/nPq+UzL9ipL
         16u9SaoPamxKPuQBBp51BfNypRkRgEpJhx7CrTaav6Ymktd570vCEC6fDmkCDB9idff8
         k4u+ZwQ/TqN+sLMAhrpnmjX42dqBoawsUhJpx2ztMsXTAVvol1GbHjIcHgF+wI0LQWQH
         ngEQ==
X-Gm-Message-State: ABy/qLY7CNdoc9zgXU+UL2+gxKmz3TnLHATzjYQ0nAhmU5Qg/HVcslAH
	sH6DBWqmL2ZX3ePLE977tkc=
X-Google-Smtp-Source: APBJJlH2UNtTGC8nZZnk8cJsui63PsvCqbA2j22TBkK9asviiVC12PDgkQ98kSuFiNgAamwR3I443Q==
X-Received: by 2002:ac8:5c4f:0:b0:3fd:ec2e:cd75 with SMTP id j15-20020ac85c4f000000b003fdec2ecd75mr1101874qtj.15.1689225969635;
        Wed, 12 Jul 2023 22:26:09 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id 28-20020a17090a001c00b00263258fda1bsm11745740pja.46.2023.07.12.22.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 22:26:08 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <7937b1c9-cde3-29ad-66dd-c95c4f0506ca@gmail.com>
Date: Thu, 13 Jul 2023 13:26:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: entry: set a0 prior to syscall_handler
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
References: <20230711062202.3542367-1-CoelacanthusHex@gmail.com>
 <CAJF2gTRgXbEfQWiWtZtVNBDhpY2miG_ByHrVZF2fbfu60hCHcQ@mail.gmail.com>
Content-Language: en-GB-large
In-Reply-To: <CAJF2gTRgXbEfQWiWtZtVNBDhpY2miG_ByHrVZF2fbfu60hCHcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_222612_295788_2317822F 
X-CRM114-Status: GOOD (  17.08  )
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

Ck9uIDIwMjMvNy8xMyAwODowMCwgR3VvIFJlbiB3cm90ZToKPiBPbiBUdWUsIEp1bCAxMSwgMjAy
MyBhdCAyOjIy4oCvQU0gQ2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdy
b3RlOgo+Pgo+PiBXaGVuIHdlIHRlc3Qgc2VjY29tcCB3aXRoIDYuNCBrZXJuZWwsIHdlIGZvdW5k
IGVycm5vIGhhcyB3cm9uZyB2YWx1ZS4KPj4gSWYgd2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGgg
RUFGTk9TVVBQT1JULCBhZnRlciBmMGJkZGY1MDU4NmQsIHdlIHdpbGwKPj4gZ2V0IEVOT1NZUy4g
V2UgZ290IHNhbWUgcmVzdWx0IHdpdGggOWMyNTk4ZDQzNTEwICgicmlzY3Y6IGVudHJ5OiBTYXZl
IGEwCj4+IHByaW9yIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSIpLgo+Pgo+PiBDb21w
YXJlZCB3aXRoIHg4NiBhbmQgbG9vbmdhcmNoJ3MgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBwYXJ0
IG9mIHRoZQo+PiBmdW5jdGlvbiwgd2UgdGhpbmsgdGhhdCByZWdzLT5hMCA9IC1FTk9TWVMgc2hv
dWxkIGJlIGFkdmFuY2VkIGJlZm9yZQo+PiBzeXNjYWxsX2hhbmRsZXIgdG8gZml4IHRoaXMgcHJv
YmxlbS4gV2UgaGF2ZSB3cml0dGVuIHRoZSBmb2xsb3dpbmcgcGF0Y2gsCj4+IHdoaWNoIGNhbiBm
aXggdGhpcyBwcm9ibGVtIGFmdGVyIHRlc3RpbmcuIEJ1dCB3ZSBkb24ndCBrbm93IGVub3VnaCBh
Ym91dAo+PiB0aGlzIHBhcnQgb2YgdGhlIGNvZGUgdG8gZXhwbGFpbiB0aGUgcm9vdCBjYXVzZS4g
SG9wZSBzb21lb25lIGNhbiBmaW5kCj4+IGEgcmVhc29uYWJsZSBleHBsYW5hdGlvbi4gQW5kIHdl
J2QgbGlrZSB0byByZXdvcmQgdGhpcyBjb21taXQgbWVzc2FnZQo+PiBhY2NvcmRpbmcgdG8gdGhl
IGV4cGxhbmF0aW9uIGluIHYyCj4+Cj4+IEZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjogZW50
cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4+IFJlcG9ydGVkLWJ5OiBGZWxpeCBZYW4g
PGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4+IENvLWRldmVsb3BlZC1ieTogUnVpemhlIFBh
biA8YzE0MTAyOEBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFJ1aXpoZSBQYW4gPGMxNDEw
MjhAZ21haWwuY29tPgo+PiBDby1kZXZlbG9wZWQtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3Jj
LmlzY2FzLmFjLmNuPgo+PiBTaWduZWQtb2ZmLWJ5OiBTaGlxaSBaaGFuZyA8c2hpcWlAaXNyYy5p
c2Nhcy5hYy5jbj4KPj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hl
eEBnbWFpbC5jb20+Cj4+IFRlc3RlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFyc0BhcmNobGlu
dXgub3JnPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCAzICstLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPj4gaW5kZXggZjkxMGRmY2NiZjVkMi4uY2NhZGI1ZmZkMDYzYyAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4+IEBAIC0zMDEsNiArMzAxLDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFw
X3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+Cj4+
ICAgICAgICAgICAgICAgICByZWdzLT5lcGMgKz0gNDsKPj4gICAgICAgICAgICAgICAgIHJlZ3Mt
Pm9yaWdfYTAgPSByZWdzLT5hMDsKPj4gKyAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZ
UzsKPiBPaCwgbm8uIFlvdSBkZXN0cm95ZWQgdGhlIGEwIGZvciBzeXNjYWxsX2hhbmRsZXIsIHJp
Z2h0PyBJdCdzIG5vdAo+IHJlYXNvbmFibGUuIExldCdzIHNlZSB3aGljaCBzeXNjYWxsX2hhbmRs
ZXIgbmVlZHMgYTA9LUVOT1NZUy4KPiAKPiBDb3VsZCB5b3UgZ2l2ZSBvdXQgbW9yZSBkZXRhaWwg
b24geW91ciB0ZXN0IGNhc2U/Cj4gCgpPdXIgdGVzdCBjYXNlIGlzIGhlcmU6CgppbnQgbWFpbigp
IHsKICBzY21wX2ZpbHRlcl9jdHggY3R4OwogIGN0eCA9IHNlY2NvbXBfaW5pdChTQ01QX0FDVF9B
TExPVyk7CgogIHNlY2NvbXBfcnVsZV9hZGRfZXhhY3QoY3R4LCBTQ01QX0FDVF9FUlJOTyhFQUZO
T1NVUFBPUlQpLCBTQ01QX1NZUyhzb2NrZXQpLCAyLAogICAgICAgICAgICAgICAgICAgICAgICAg
U0NNUF9DTVAoMCwgU0NNUF9DTVBfRVEsIEFGX05FVExJTkspLAogICAgICAgICAgICAgICAgICAg
ICAgICAgU0NNUF9DTVAoMiwgU0NNUF9DTVBfRVEsIE5FVExJTktfQVVESVQpKTsKCiAgaWYgKHNl
Y2NvbXBfbG9hZChjdHgpIDwgMCkgewogICAgcGVycm9yKCJzZWNjb21wX2xvYWQiKTsKICAgIGV4
aXQoRVhJVF9GQUlMVVJFKTsKICB9CgogIGludCBzb2NrX2ZkMSA9IHNvY2tldChBRl9ORVRMSU5L
LCBTT0NLX1JBVywgTkVUTElOS19HRU5FUklDKTsKICBpZiAoc29ja19mZDEgPCAwKSB7CiAgICBw
cmludGYoIjFzdCBzb2NrZXQgc3lzY2FsbCBmYWlsZWQgd2l0aCByZXR1cm4gdmFsdWUgJWQgYW5k
IGVycm5vICVkICglcyksIHdoaWNoIGlzIHVuZXhwZWN0ZWRcbiIsCiAgICAgICAgICAgc29ja19m
ZDEsIGVycm5vLCBzdHJlcnJvcihlcnJubykpOwogICAgc2VjY29tcF9yZWxlYXNlKGN0eCk7CiAg
ICByZXR1cm4gMTsKICB9CiAgcHJpbnRmKCIxc3Qgc29ja2V0IGNyZWF0ZWQgc3VjY2Vzc2Z1bGx5
LCBhcyBleHBlY3RlZC5cbiIpOwoKICBpbnQgc29ja19mZDIgPSBzb2NrZXQoQUZfTkVUTElOSywg
U09DS19SQVcsIE5FVExJTktfQVVESVQpOwogIGlmIChzb2NrX2ZkMiA8IDApIHsKICAgIHByaW50
ZigiMm5kIHNvY2tldCBzeXNjYWxsIGZhaWxlZCB3aXRoIHJldHVybiB2YWx1ZSAlZCBhbmQgZXJy
bm8gJWQgKCVzKS5cbiIsIHNvY2tfZmQyLCBlcnJubywKICAgICAgICAgICBzdHJlcnJvcihlcnJu
bykpOwoKICAgIGlmIChlcnJubyA9PSBFQUZOT1NVUFBPUlQpIHsKICAgICAgcHJpbnRmKCIybmQg
c29ja2V0IHN5c2NhbGwgZmFpbGVkIHdpdGggRUFGTk9TVVBQT1JULCBhcyBleHBlY3RlZC5cbiIp
OwogICAgICBzZWNjb21wX3JlbGVhc2UoY3R4KTsKICAgICAgcmV0dXJuIDA7CiAgICB9IGVsc2Ug
ewogICAgICBwcmludGYoIjJuZCBzb2NrZXQgc3lzY2FsbCBmYWlsZWQgd2l0aCB1bmV4cGVjdGVk
IGVycm5vLCB3aGljaCBpcyB1bmV4cGVjdGVkLlxuIik7CiAgICAgIHNlY2NvbXBfcmVsZWFzZShj
dHgpOwogICAgICByZXR1cm4gMTsKICAgIH0KICB9CiAgcHJpbnRmKCIybmQgc29ja2V0IGNyZWF0
ZWQgc3VjY2Vzc2Z1bGx5LCB3aGljaCBpcyB1bmV4cGVjdGVkLlxuIik7CiAgc2VjY29tcF9yZWxl
YXNlKGN0eCk7CgogIHJldHVybiAyOwp9Cgo+Pgo+PiAgICAgICAgICAgICAgICAgcmlzY3Zfdl92
c3RhdGVfZGlzY2FyZChyZWdzKTsKPj4KPj4gQEAgLTMwOCw4ICszMDksNiBAQCBhc21saW5rYWdl
IF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPj4KPj4gICAgICAgICAgICAgICAgIGlmIChzeXNjYWxsIDwgTlJfc3lzY2Fs
bHMpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNj
YWxsKTsKPj4gLSAgICAgICAgICAgICAgIGVsc2UKPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
cmVncy0+YTAgPSAtRU5PU1lTOwo+Pgo+PiAgICAgICAgICAgICAgICAgc3lzY2FsbF9leGl0X3Rv
X3VzZXJfbW9kZShyZWdzKTsKPj4gICAgICAgICB9IGVsc2Ugewo+PiAtLQo+PiAyLjQxLjAKPj4K
PiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
