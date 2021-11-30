Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8792C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDR8oU4izoM6kMAzKj65XjArrvYTSuXjEy5H+UJjcAg=; b=VrTJWx7fmveucb
	wSeXFpRBaOAf39Hv2eDmVXzP6MNlR2Q5n2co3YAluG6sRx4Do+XY4Nrw+WUEm8aAt9Hpf1UZWxNoH
	GXaK8zxDzaKio077bLfIi5gnZBbGUrvlItexXnAONxvP8qcNIn8lXJwIDs6n/tcIPaGiODQayEPT5
	eUDle++YrgobpmC6zq1lOb4vUAe0w6TGS5PGk9lIaLL5PhtAlwOiAxabiwY7GyZs96YWaet9uS4Jb
	/qhK+Apk27D+phtYGGL25f0gkyBI8IaDSrrKsRAriipdadj25OLG3YdyqcfnK0+agw6POjVbrcRIs
	ME8ooln1wBeggz3YyNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms318-005Iz4-O1; Tue, 30 Nov 2021 13:17:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms315-005IxH-MM
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 13:17:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o13so44239288wrs.12
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 05:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VEsUwdxPY7Uj9kvn4cA/oDWG3LVG7CgUzhJ5udUVC/0=;
 b=JohDjlcVYhMurxBZlQ2EByjTX4OrXyZsMstLrb17g3YmRDC6ZdroIJEfnCEWD82YaK
 piHQOv6At3x+X54Dp43fIb5pSL40ADU6ouR6rKlG4c80Q99Ny58zHkM4VjSTYjg826ox
 P8Hp5Cn8fYkx8slDoOMccwuy2T5Bm1FzuiAIamo2F6rETxx4sKlqMLeRYAhacdEpksA8
 KpGPsfp+w5PiddKf0OQIRfsAzgjEdwa6VpVqPBNjdTgY/5w4zCioEwXKlVcGsLHDDjlJ
 0+s6JfPKb8OLpqvT/nCCfX7YkCz41WRK/B4fZF1L1G/dkwUs5LHzHZXiGK/GL8xqzWdQ
 RIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=VEsUwdxPY7Uj9kvn4cA/oDWG3LVG7CgUzhJ5udUVC/0=;
 b=ChewXbcvHYEKqDaxPOfVU4zS908n2wndJlDFJxGy80JgL9BN4lkuV0QAdTYRQg7Xpy
 ZqG7vXSXO3dWraowmKx+1A5DTDpLOWKXQc6LWGdBrP15KqtNKjDcaDH4citEIW//I4x9
 q4FP14FwyauWktNFsYP3t2vLmeG9sNdpSukHbr4viDYmMHk6sNIxNL6L5ybKwbbR6/Ci
 IbE6oJOFSSGFjmZ90uS/pS8/8w98eBbuRvtZJhfaOwVtb2ik1Lzog6Uwe3tyn+lVTUn2
 ZP0Pw8sFZjIOuQ1FhwQgLn1s+wIio2AwpiMtvf6bu9i9+IpusXZ63Pr6peKCZYtqNG2o
 eJsw==
X-Gm-Message-State: AOAM532aBWl60M2slVgOEQQ7rjjKCNciB+kH+FPlsP0MHmpj1p6Bqxbu
 qnQr5UPJAQIIToYCHtyQr93bpw==
X-Google-Smtp-Source: ABdhPJyo9i5da+tky2D1vAoae1D7XArRcImXxlP40qx29nfDOYfYi3oVmlZKywKwzRrwz27OcOtQeQ==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr39488975wri.382.1638278263044; 
 Tue, 30 Nov 2021 05:17:43 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id g5sm21775978wri.45.2021.11.30.05.17.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Nov 2021 05:17:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <1909580.k68io2XIxi@diego>
Date: Tue, 30 Nov 2021 13:17:41 +0000
Cc: Wei Fu <wefu@redhat.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 Dan Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>, jscheid@ventanamicro.com,
 rtrauben@gmail.com, Anup Patel <anup@brainfault.org>,
 Rob Herring <robh+dt@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 atishp04@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <guoren@kernel.org>,
 =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, hch@lst.de,
 liush@allwinnertech.com, Wei Wu <lazyparser@gmail.com>,
 drew@beagleboard.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-Id: <D7F256F9-F31F-4663-AADD-A535E159F87C@jrtc27.com>
References: <20211129014007.286478-1-wefu@redhat.com>
 <97431cab-d67d-4bc7-e181-d64534791f03@canonical.com>
 <9930802.MB9u6SvQ6m@diego> <1909580.k68io2XIxi@diego>
To: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_051751_760773_293C6C40 
X-CRM114-Status: GOOD (  12.83  )
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

T24gMzAgTm92IDIwMjEsIGF0IDEyOjA3LCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRl
PiB3cm90ZToKPiAKPiBBbSBNb250YWcsIDI5LiBOb3ZlbWJlciAyMDIxLCAxMzowNjoyMyBDRVQg
c2NocmllYiBIZWlrbyBTdMO8Ym5lcjoKPj4gQW0gTW9udGFnLCAyOS4gTm92ZW1iZXIgMjAyMSwg
MDk6NTQ6MzkgQ0VUIHNjaHJpZWIgSGVpbnJpY2ggU2NodWNoYXJkdDoKPj4+IE9uIDExLzI5LzIx
IDAyOjQwLCB3ZWZ1QHJlZGhhdC5jb20gd3JvdGU6Cj4+Pj4gRnJvbTogV2VpIEZ1IDx3ZWZ1QHJl
ZGhhdC5jb20+Cj4+Pj4gCj4+Pj4gUHJldmlvdXMgcGF0Y2ggaGFzIGFkZGVkIHN2cGJtdCBpbiBh
cmNoL3Jpc2N2IGFuZCBhZGQgInJpc2N2LHN2cG1idCIKPj4+PiBpbiB0aGUgRFQgbW11IG5vZGUu
IFVwZGF0ZSBkdC1iaW5kaW5ncyByZWxhdGVkIHByb3BlcnR5IGhlcmUuCj4+Pj4gCj4+Pj4gU2ln
bmVkLW9mZi1ieTogV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+Cj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+PiBDYzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KPj4+PiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPj4+PiBD
YzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDEwICsrKysrKysr
KysKPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4+PiAKPj4+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPj4+
PiBpbmRleCBhYTVmYjY0ZDU3ZWIuLjlmZjljYmRkOGE4NSAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4+Pj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+Pj4+IEBA
IC02Myw2ICs2MywxNiBAQCBwcm9wZXJ0aWVzOgo+Pj4+ICAgICAgICAtIHJpc2N2LHN2NDgKPj4+
PiAgICAgICAgLSByaXNjdixub25lCj4+Pj4gCj4+Pj4gKyAgbW11Ogo+Pj4gCj4+PiBTaG91bGRu
J3Qgd2Uga2VlcCB0aGUgaXRlbXMgYmUgaW4gYWxwaGFiZXRpYyBvcmRlciwgaS5lLiBtbXUgYmVm
b3JlIAo+Pj4gbW11LXR5cGU/Cj4+PiAKPj4+PiArICAgIGRlc2NyaXB0aW9uOgo+Pj4+ICsgICAg
ICBEZXNjcmliZXMgdGhlIENQVSdzIE1NVSBTdGFuZGFyZCBFeHRlbnNpb25zIHN1cHBvcnQuCj4+
Pj4gKyAgICAgIFRoZXNlIHZhbHVlcyBvcmlnaW5hdGUgZnJvbSB0aGUgUklTQy1WIFByaXZpbGVn
ZWQKPj4+PiArICAgICAgU3BlY2lmaWNhdGlvbiBkb2N1bWVudCwgYXZhaWxhYmxlIGZyb20KPj4+
PiArICAgICAgaHR0cHM6Ly9yaXNjdi5vcmcvc3BlY2lmaWNhdGlvbnMvCj4+Pj4gKyAgICAkcmVm
OiAnL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nJwo+Pj4+ICsgICAgZW51
bToKPj4+PiArICAgICAgLSByaXNjdixzdnBtYnQKPj4+IAo+Pj4gVGhlIHByaXZpbGVnZWQgc3Bl
Y2lmaWNhdGlvbiBoYXMgbXVsdGlwbGUgTU1VIHJlbGF0ZWQgZXh0ZW5zaW9uczogCj4+PiBTdm5h
cG90LCBTdnBibXQsIFN2aW52YWwuIFNoYWxsIHRoZXkgYWxsIGJlIG1vZGVsZWQgaW4gdGhpcyBl
bnVtPwo+PiAKPj4gSSByZW1lbWJlciBpbiBzb21lIGVhcmxpZXIgdmVyc2lvbiBzb21lIHdheSBi
YWNrIHRoZXJlIHdhcyB0aGUKPj4gc3VnZ2VzdGlvbiBvZiB1c2luZyBhIHN1Yi1ub2RlIGluc3Rl
YWQgYW5kIHRoZW4gYWRkaW5nIGJvb2xlYW4KPj4gcHJvcGVydGllcyBmb3IgdGhlIHN1cHBvcnRl
ZCBleHRlbnNpb25zLgo+PiAKPj4gQWthIHNvbWV0aGluZyBsaWtlCj4+IAltbXUgewo+PiAJCXJp
c2N2LHN2cGJtdDsJCj4+IAl9Owo+IAo+IEZvciB0aGUgcmVjb3JkLCBJJ20gdGFsa2luZyBhYm91
dCB0aGUgbWFpbCBmcm9tIHNlcHRlbWJlcgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2L0NBQWVMdFVDaGpqekcrUDh5ZzQ1R0xaTUp5NVVSMks1UlJCb0xGVlpodE9hWjVwUHRF
QUBtYWlsLmdtYWlsLmNvbS8KPiAKPiBTbyBoYXZpbmcgYSBzdWItbm9kZSB3b3VsZCBtYWtlIGFk
ZGluZyBmdXR1cmUgZXh0ZW5zaW9ucwo+IHdheSBuaWNlci4KClN2cGJtdCBpcyBqdXN0IGFuIElT
QSBleHRlbnNpb24sIGFuZCBzaG91bGQgYmUgdHJlYXRlZCBsaWtlIGFueSBvdGhlci4KTGV04oCZ
cyBub3QgaW52ZW50IHR3byBkaWZmZXJlbnQgd2F5cyBvZiByZXByZXNlbnRpbmcgdGhhdCBpbiB0
aGUgZGV2aWNlCnRyZWUuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
