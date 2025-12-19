Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC969D78789
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihk86RRsYIdQIsdKa+LSfroBa4onrNAfSzHm/Hgzym4=; b=syGG/pDvqBgkQ7
	fpB4p3vlzA87u39eUtiGItTxXqiKTI1L/cpjVwlHe/DG0GnyC5DkGs0VegO6naRwBG7T2E8OY64cp
	QpCENKAgxq27Tr7DqaaoH4ihnKhRfLvY40lkr+K3qThWgUw9bv8NyXrRgDw4mmk05kTjRlxNHnM0o
	tpoWI3CiVnKpbNLWJg8DsSBUZRSwdDQvJ9b0LXsvTeU7+o7VnxKHHljY0+VaTxgUHaNjilZ75Okbs
	Il/e5PMJTJaVHQIVNSX2oYSjqvRurTj+FYaBYn1L+WDC3VNZhqYVliOcylh23GRd8IvP7grHSclWw
	vhxAJPVOciMdOu57tAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcI8-0000000AVDO-0aVj;
	Fri, 19 Dec 2025 15:21:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcI4-0000000AVCy-2Vny
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 15:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766157671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8GNrUURfSmzebc65djIow5Kw9CK6Frte1+TYEv6Oem4=;
	b=Mky0QqZqCp8HIkENgYvOY6pUukfUm3OffEI81nsYE17hQDhN6DrlHNf5VfDcIPTpGoH/z8
	Z7cch7Op0RYa/BYz1WysyP+6YPv0Er0HJn2rep0IjKBbg+LD/HSBBV+x8OUN/yHzBXr5Gg
	oiPvzABaOfAyWQQJ4inH1EhnFBS1UYE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-013ygSQAOg-kXed3_QZYGA-1; Fri, 19 Dec 2025 10:21:06 -0500
X-MC-Unique: 013ygSQAOg-kXed3_QZYGA-1
X-Mimecast-MFC-AGG-ID: 013ygSQAOg-kXed3_QZYGA_1766157665
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c213419f5so1800294a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 07:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766157664; x=1766762464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8GNrUURfSmzebc65djIow5Kw9CK6Frte1+TYEv6Oem4=;
        b=bRuR9Apn6Qzyu5SZEzjcsapNwvYmy9dqyKsjMQ9Uvg/f/8WWRUA3fb/bopNHGQ9Jqm
         3AkenQCp5FgQwohSSUco6jymRxU0MPgz3gM9coPhmbWr3cu/DQqTPdwTjisYKaImihh9
         ji1r3PwUevHS6HkmL5aIxQZPcPJm3cyL28pRoU74e/8JGYEY4AUupW5iLU08L4Ni1QBc
         4VkPXDWOD2ToxLFyb8c3YbX/u0/1CMqjokK5nwSTfkKSqnREBacahZAZFO9uQumFZz0W
         Vyu5hAWim5FeAVBjBfJoeAs53EPyZ0WhlP8dYZFb64P5ch33o+9aq9gPAgAq3oQfKSaX
         Tkvw==
X-Forwarded-Encrypted: i=1; AJvYcCUbCqoTiPetvHaDOCqgy/IwqTfBwCVDWL+nwGBJJgbuVi3l/itTvTnv83tSibFOT/N6o4ypmVUpL+l8KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKB0AppgUh7YWa/p6QrOlMsyp61RFU7AV0VlssgxGkQCUPx2VN
	hgnV0uXN9HoOORqtGZhfeNqPyUhzZU3qTkCUF9nVHsFtoGlW23HVEp3a7p9prkrKibNdDS3gKau
	hcTcmaU29lDGHl6esEz5bc9Iy4XxYVkBKTkyp24AcAz1kzBB+diUvmi7Dd2T3Jkpq4TCcJsLZr2
	B3Z1ztYDPu4inqM6beavL5amMuhqh80sz7XMqwLTGB14lO
X-Gm-Gg: AY/fxX5TpOcsvTxYe6yiWC9YYCsX0rFGnjumMsTopw5GeUh+uwp23yiPj27A9Cbplb3
	zXU7CoJpKItmnJ1MozU0VuXkf+sgG5N98MYS1xIKaGpQONBREIl0Np3Ewf7mORr4iKoEj09U8SF
	vgIp6z0c1d0ERmbS0cajeLp21y6/nIXaFOcstrMtDpmSSt/VQplh0JTnPqckt/zIVyynwVFUzJP
	bP9PHo=
X-Received: by 2002:a17:90b:5547:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-34e921cc010mr3005041a91.27.1766157664003;
        Fri, 19 Dec 2025 07:21:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFEpuejWFp7fSKwerVlVcCgXqrnYOoWHQGcUkurutrqVKPcESqG+rFzqWmLZAKiKvlEuJhChthrKgtuozV8HA=
X-Received: by 2002:a17:90b:5547:b0:34c:9cec:dd83 with SMTP id
 98e67ed59e1d1-34e921cc010mr3005011a91.27.1766157663469; Fri, 19 Dec 2025
 07:21:03 -0800 (PST)
MIME-Version: 1.0
References: <CAJD_bPKbZaEHmKzVcLPGJuR3Y3MO1AJDA0TmLZrLkCJ0PzCM1A@mail.gmail.com>
 <CADxym3b=gBhefPMUCeiE_H0WPbG9AuL5tGe_6gsCZ8wi1ifJoA@mail.gmail.com>
In-Reply-To: <CADxym3b=gBhefPMUCeiE_H0WPbG9AuL5tGe_6gsCZ8wi1ifJoA@mail.gmail.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Fri, 19 Dec 2025 10:20:51 -0500
X-Gm-Features: AQt7F2qqt-p_zldZTjyDB7sjira-h7NBbmxMyRxRQLiF0daePQk2q7cGbnDUSYo
Message-ID: <CAJD_bPJyCZGm5zBhnB_tfSkFjn7BgeDMgmTuRNDsz24F73ofWw@mail.gmail.com>
Subject: Re: [REGRESSION] Cannot boot 6.19-rc1 on riscv64 with BPF enabled.
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, ast@kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yimUEnkR02VFFY7_XieXbS7bqeIt0nOLykcmbE9Au6w_1766157665
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_072112_737283_1F93D03C 
X-CRM114-Status: GOOD (  17.86  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgOTo1MuKAr0FNIE1lbmdsb25nIERvbmcgPG1lbmdsb25n
OC5kb25nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIERlYyAxOSwgMjAyNSBhdCAxMDoz
NuKAr1BNIEphc29uIE1vbnRsZW9uIDxqbW9udGxlb0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4g
PiBXaGVuIGJvb3RpbmcgcmlzY3Y2NCBzeXN0ZW1zIHdpdGggQlBGIGVuYWJsZWQgdXNpbmcgNi4x
OS1yYzEgdGhlCj4gPiBzeXN0ZW0gcHJvZHVjZXMgdGhlIGZvbGxvd2luZyBwYW5pYy4gSSB0cmll
ZCBvbiBzZXZlcmFsIGJvYXJkcyBhbmQKPiA+IHRoZXkgcmVzdWx0ZWQgaW4gdGhlIHNhbWUgZXJy
b3IuCj4KPiBTb3JyeSBhYm91dCB0aGUgcHJvYmxlbS4gSSBoYXZlIHNlbnQgYSBmaXggZm9yIHRo
aXMgaXNzdWU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjUxMjE5MTI0NzQ4Ljgx
MTMzLTEtZG9uZ21sMkBjaGluYXRlbGVjb20uY24vVC8jdQo+Cj4gQW5kIGhlcmUgaXMgdGhlIGRp
c2N1c3Npb24gYWJvdXQgaXQ6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmL0NBRHh5bTNZ
MDk4ODM2ZkhIUlNqZXJ5eENwPUNQQjhzRFUxOVRCQlZzMDdWWk9FUkpYd0BtYWlsLmdtYWlsLmNv
bS9ULyN1Cj4KPiBUaGFua3MhCj4gTWVuZ2xvbmcgRG9uZwo+CgpUaGFuayB5b3UgZm9yIHRoZSBx
dWljayByZXNwb25zZSEgSSBjYW4gY29uZmlybSB5b3VyIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZS4K
ClRoYW5rcyB5b3UhCgo+ID4KPiA+IFsgNS4zODA1ODNdIEluc3VmZmljaWVudCBzdGFjayBzcGFj
ZSB0byBoYW5kbGUgZXhjZXB0aW9uIQo+ID4gWyA1LjM4NTk4Nl0gVGFzayBzdGFjazogWzB4ZmZm
ZmZmYzYwMDAyMDAwMC4uMHhmZmZmZmZjNjAwMDI0MDAwXQo+ID4gWyA1LjM5MjMzOV0gT3ZlcmZs
b3cgc3RhY2s6IFsweGZmZmZmZmQ3ZmVmN2EwNzAuLjB4ZmZmZmZmZDdmZWY3YjA3MF0KPiA+IFsg
NS4zOTg2OTNdIENQVTogMiBVSUQ6IDAgUElEOiAxIENvbW06IHN5c3RlbWQgVGFpbnRlZDogRyBX
Cj4gPiA2LjE5LjAtcmMxLTAwMDAxLWc3NGQ5Y2FiNWI2YzEgIzE1IE5PTkUKPiA+IFsgNS40MDkz
MDJdIFRhaW50ZWQ6IFtXXT1XQVJOCj4gPiBbIDUuNDEyMjcxXSBIYXJkd2FyZSBuYW1lOiBzdGFy
Zml2ZSBTdGFyRml2ZSBWaXNpb25GaXZlIDIKPiA+IHYxLjNCL1N0YXJGaXZlIFZpc2lvbkZpdmUg
MiB2MS4zQiwgQklPUyAyMDI0LjEwLXJjMyAxMC8wMS8yMDI0Cj4gPiBbIDUuNDIzMTM0XSBlcGMg
OiBjb3B5X2Zyb21fa2VybmVsX25vZmF1bHRfYWxsb3dlZCsweGEvMHgyOAo+ID4gWyA1LjQyODcx
OF0gcmEgOiBjb3B5X2Zyb21fa2VybmVsX25vZmF1bHQrMHgyOC8weDE5OAo+ID4gWyA1LjQzMzc3
NF0gZXBjIDogZmZmZmZmZmY4MDI0MDYyYSByYSA6IGZmZmZmZmZmODAyNDA2NzAgc3AgOiBmZmZm
ZmZjNjAwMDFmZmYwCj4gPiBbIDUuNDQwOTk3XSBncCA6IGZmZmZmZmZmODI0NjRjZTggdHAgOiAw
MDAwMDAwMDAwMDAwMDAwIHQwIDogZmZmZmZmZmY4MDAyNDYyMAo+ID4gWyA1LjQ0ODIxOV0gdDEg
OiBmZmZmZmZmZjgwMTdjMDUyIHQyIDogMDAwMDAwMDAwMDAwMDAwMCBzMCA6IGZmZmZmZmM2MDAw
MjAwMzAKPiA+IFsgNS40NTU0NDJdIHMxIDogZmZmZmZmZDZjMjE5ODI2MCBhMCA6IGZmZmZmZmQ2
YzIxOTgyNjAgYTEgOiAwMDAwMDAwMDAwMDAwMDA4Cj4gPiBbIDUuNDYyNjY0XSBhMiA6IDAwMDAw
MDAwMDAwMDAwMDggYTMgOiAwMDAwMDAwMDAwMDAwMDlkIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+
ID4gWyA1LjQ2OTg4NV0gYTUgOiAwMDAwMDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAwMDAwMDAy
MSBhNyA6IDAwMDAwMDAwMDAwMDAwMDMKPiA+IFsgNS40NzcxMDZdIHMyIDogZmZmZmZmYzYwMDAy
MDA3MCBzMyA6IDAwMDAwMDAwMDAwMDAwMDggczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbIDUu
NDg0MzI3XSBzNSA6IGZmZmZmZmM2MDAwMjAwODAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3IDog
MDAwMDAwMDAwMDAzODAwMAo+ID4gWyA1LjQ5MTU0OV0gczggOiAwMDAwMDAwMDAwMDA4MDAyIHM5
IDogMDAwMDAwMDAwMDM4MDAwMCBzMTA6IGZmZmZmZmM2MDAwMjNjZjgKPiA+IFsgNS40OTg3NzFd
IHMxMTogZmZmZmZmZDZjNDE5YmYwMCB0MyA6IDAwMDAwMDAwNzdhYjlkYjkgdDQgOiAwMDAwMDAw
MDExMzkxOGU3Cj4gPiBbIDUuNTA1OTkzXSB0NSA6IGZmZmZmZmZmOWU5YmNjMjkgdDYgOiBmZmZm
ZmZjNjAwMDIzYWQ0Cj4gPiBbIDUuNTExMzA0XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAgYmFk
YWRkcjogZmZmZmZmYzYwMDAxZmZmMCBjYXVzZToKPiA+IDAwMDAwMDAwMDAwMDAwMGYKPiA+IFsg
NS41MTkyMjFdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBLZXJuZWwgc3RhY2sgb3ZlcmZs
b3cKPiA+IFsgNS41MjQ5NjddIENQVTogMiBVSUQ6IDAgUElEOiAxIENvbW06IHN5c3RlbWQgVGFp
bnRlZDogRyBXCj4gPiA2LjE5LjAtcmMxLTAwMDAxLWc3NGQ5Y2FiNWI2YzEgIzE1IE5PTkUKPiA+
IFsgNS41MzU1NzRdIFRhaW50ZWQ6IFtXXT1XQVJOCj4gPiBbIDUuNTM4NTQ0XSBIYXJkd2FyZSBu
YW1lOiBzdGFyZml2ZSBTdGFyRml2ZSBWaXNpb25GaXZlIDIKPiA+IHYxLjNCL1N0YXJGaXZlIFZp
c2lvbkZpdmUgMiB2MS4zQiwgQklPUyAyMDI0LjEwLXJjMyAxMC8wMS8yMDI0Cj4gPiBbIDUuNTQ5
NDA4XSBDYWxsIFRyYWNlOgo+ID4gWyA1LjU1MTg1OV0gWzxmZmZmZmZmZjgwMDFlNDM4Pl0gZHVt
cF9iYWNrdHJhY2UrMHgyOC8weDM4Cj4gPiBbIDUuNTU3MjYyXSBbPGZmZmZmZmZmODAwMDI0NjI+
XSBzaG93X3N0YWNrKzB4M2EvMHg1MAo+ID4gWyA1LjU2MjMxN10gWzxmZmZmZmZmZjgwMDE2ZDAy
Pl0gZHVtcF9zdGFja19sdmwrMHg1YS8weDgwCj4gPiBbIDUuNTY3NzIwXSBbPGZmZmZmZmZmODAw
MTZkNDA+XSBkdW1wX3N0YWNrKzB4MTgvMHgyMAo+ID4gWyA1LjU3Mjc3Nl0gWzxmZmZmZmZmZjgw
MDAyYjdhPl0gdnBhbmljKzB4ZjIvMHgyZDAKPiA+IFsgNS41Nzc1NzBdIFs8ZmZmZmZmZmY4MDAw
MmQ5Nj5dIHBhbmljKzB4M2UvMHg0OAo+ID4gWyA1LjU4MjE5MV0gWzxmZmZmZmZmZjgwMDFlMTEw
Pl0gaGFuZGxlX2JhZF9zdGFjaysweDk4LzB4YzAKPiA+IFsgNS41ODc3NjVdIFs8ZmZmZmZmZmY4
MDI0MDY3MD5dIGNvcHlfZnJvbV9rZXJuZWxfbm9mYXVsdCsweDI4LzB4MTk4Cj4gPiBbIDUuNTk0
MTIyXSBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzCj4gPiBbIDUuNTk4MDcwXSAtLS1bIGVu
ZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogS2VybmVsIHN0YWNrIG92ZXJmbG93IF0tLS0K
PiA+Cj4gPiBBIGJpc2VjdCBpZGVudGlmaWVkIDQ3YzkyMTRkY2IgYXMgdGhlIHByb2JsZW1hdGlj
IGNvbW1pdDoKPiA+IFs0N2M5MjE0ZGNiZWE5MDQzYWMyMDQ0MWEyODVjN2JiNTQ4NmI4YjJkXSBi
cGY6IGZpeCB0aGUgdXNhZ2Ugb2YKPiA+IEJQRl9UUkFNUF9GX1NLSVBfRlJBTUUKPiA+Cj4gPiBU
aGlzIGNvbW1pdCByZXZlcnRzIGNsZWFubHkgYW5kIHdoZW4gYnVpbGRpbmcgNi4xOS1yYzEgd2l0
aG91dCBpdCBJIGFtCj4gPiBhYmxlIHRvIGJvb3Qgc3VjY2Vzc2Z1bGx5Lgo+ID4KPiA+IEEgY29w
eSBvZiB0aGUgdHJhY2UsIGJpc2VjdCBsb2csIGFuZCBjb25maWcgdXNlZCB0byByZXByb2R1Y2Ug
dGhlCj4gPiBwcm9ibGVtIGFyZSBhdDoKPiA+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2ptb250
bGVvbi9iOGI4NjEzNTJlN2I5YmM5ZmQzYTkzZDM5MTkyNmRlYwo+ID4KPiA+ICNyZWd6Ym90IGlu
dHJvZHVjZWQ6IDQ3YzkyMTRkY2IKPiA+Cj4gPiBUaGFuayB5b3UsCj4gPiBKYXNvbiBNb250bGVv
bgo+ID4KPgoKCi0tIApKYXNvbiBNb250bGVvbiAgICAgICAgfCBlbWFpbDogam1vbnRsZW9AcmVk
aGF0LmNvbQpSZWQgSGF0LCBJbmMuICAgICAgICAgfCBncGcga2V5OiAweDA2OUUzMDIyCkNlbGw6
IDUwOC00OTYtMDY2MyAgICB8IGlyYzogam1vbnRsZW8gLyBqbW9udGxlb24KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
