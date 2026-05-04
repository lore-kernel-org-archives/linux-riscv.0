Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9189DCD3430
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xOWy1dB529aT38yzKoL/cZNXfjC2Bq//3ip7UrVYwT8=; b=xtipw49oyPL5JWz1XuLq1ueqqI
	D0T7DzC5B5US7KC3ZzMpTiS+qvknOQmVPjh+9LHFLG3Cl8PRZU/jJFaSKNquqqh45tXqlcqOHEhWy
	54fRbFoWbP0ylL4mb8fCCxfV7QsxBT3IKBbDDzIkfo2PaCXKLgtCDfXCQjb6p+YDUk5+uvTCa7HH8
	3IqtSY+jbCZguPU803kxEdOMI903sRQ5vPvo9zLPNAqyXT59I0uKIrhAghkeYypdwEI3lR1Dz/w3q
	oO24pxvPPXDGZoezhSyXdjK0T0hIgcWUd7cv46vwtFBim5yfNf5kfLRSv0C/PrCwEve7hg4rVFLTa
	pA6pgWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtKw-0000000DJEF-14RR;
	Mon, 04 May 2026 13:27:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtKt-0000000DJDl-1et4
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 13:27:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso2561754a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 06:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777901265; cv=none;
        d=google.com; s=arc-20240605;
        b=IdXI/iMtbEmMx9JEgyAGzpNk9KrgNvCDwNFfvFUdwC2ZiPzyr2r+prxMBMSiRqxpwO
         67VXY9ell4Txo3uB3JmryYonBQuEqPsbmf1X/6NvnpXZ8ThPcXUcsTdhYsa/z39S8JpX
         alOUMWRHnIo2jSLC1hSe+xB11RYc5rqvuE3wTHJfpkxwp5X6tvBqO6dlmmALOwD/mxcB
         PuI/Pk0bes68BteSbbfpW3qLnr2NGG+zeU48ilGaEpnI5bawv5ZBqHaDomRQXMELQrH/
         bMyINkZv4m40C87mDHEBREfiQy8VKF/hTkX3Naipd7bShbVJ/EujUc5b1Sx1FJ/hSA/q
         mZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lhL7EhO6MQc7SPZA0OFXuV9cxU43NwQ47e+u0/G/GRw=;
        fh=X+gY6VgLXK/sGX2XWAUAnPTg17p9QLf5/e/XXIkUxIE=;
        b=FU1iZdcPIf87mbHdKK2Vd/+eTjS+rKmXjQL3wMRVogN5CzF8RzMu43vCpGjk7A51H8
         QIgz2kXGeT57jBQwvLbZb4FiWospVN2Me3yHznchnjG2PF2cH7tEIZZm2Qu9moGI0/47
         VgJU6MSii0zvMGkTcvKXBr/Xg3LJcOf3qp8bW58b/ObWBvKcvN/6FvcYujwHbNgujQiU
         BuDrT+sy7ORUfHhjz35HaHdU7qXYrWcMTHypoN76aB3x5gj+aAAvvmkxnYylFOJ0qC8n
         ZDPdDeOhm/tOQrkMjUBs9kctT9+wxbo+6eQqaHqZcuP5BKUqzVVpTbpEGeU62w0PGg9I
         /+zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777901265; x=1778506065; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhL7EhO6MQc7SPZA0OFXuV9cxU43NwQ47e+u0/G/GRw=;
        b=DJC+WDY4z2Ti30qp8AZwccMV7LcE7ZyM8T/6npDuXHkxxFQLOI9oEmB/OR3ePHRprV
         6g64WhYVFQKlElrBBxeJna6gyT56Y6h9yKW72XfyLgW58Sl5KPrbinqwNNIfb+aXd61h
         SO0AcFzGEhd2WCFtkqxKSWUZLTcSwK5fF/BSyRliIv6j+nfCmjMLJHRzl9MIA2Fw09XW
         K4UrsyNmrsN/ZFJlVjFvZJHeiUUnfapdFNqVt9VPOR7k9Ne028Ap9VPepjXZg3U1RdpF
         aXyueZly27e2Ey9PySKndxsMSSc9hoBYViaIPuI8KNE+IfasjqspGCuQam0mEWNIZ4N3
         yJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901265; x=1778506065;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhL7EhO6MQc7SPZA0OFXuV9cxU43NwQ47e+u0/G/GRw=;
        b=dJcFRV4j8m4E1Q8+wsdFV/Z5GJLAi9J/n+AwhcONihZsJ7GUvo99BwkaAHd9PN1mx1
         1CsEGu4sobQ7dPKzQMThAbgjocUpjF3wBTZCNOvrmmpwx/e/cBC0nw52rX6CgJKIsqno
         DqQmqw+A2h69gjMvPO8Sxl7vLvkz/Tv7xRP9AkqPUQF9Lwarabg/N63f/jZRMnCd0/Fv
         LqeT/tVfZ+RNYFmgl0o7HGBJF6duk+4PODmcjiS5Bsop97D/tRW+xbbvzmNBXHgGQ7Kg
         t4nbEaE5bN2yll1tpcCe/xuLmHK9px38PLggwdSHHdwwxl2ZzgLpmkop/W2M7LDtk3fM
         Nnuw==
X-Forwarded-Encrypted: i=1; AFNElJ+azQRLw3v6bif81dD9AcGTS1cXmsJIZGAj+M5lMrQdNjjebHMeMn2eot2IwxLr1kyZPfUUoKeOxnCg1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFyckIWjVl2Cgiz7973gAWo4gtqysQifAcKjufSuLoy15sQ4SG
	dgjOwUrrfLoErv9/ycXx3j/4+QHUnodHn1Lie3KsZ5EanepzsCU1x6Pr4cA4LaMilKVItbZrdC/
	MnXwOENvTHXqyiBo4MrqSeHg6lc9DsRc=
X-Gm-Gg: AeBDietvSyqTej5X57Ld00wYgcSt+9BJj6mQDerFZENbU3kqbPfcJg5z/uL7I+U1A/T
	Qxw0IT4bNHu5QWYl9mq0BiVLsMe2W5eMwIZM4Ds8WK3Qe4LGOwKud3k4LHkD3zF6U+6Bs7OgofR
	glpuL8TWKXme4Z2gsv8Tk4fkFrtvwVyUmj+CIqFJIwfGH3JSA0yWBSCgD5HU6OCdI8A1TCrCq5K
	XDtarUI/HACFBNV+VvwLHnQOcf1ssM/Cp6pMdpH/MHw2SpKm5HoI31AxMCoeg58Pb1+5NCRj2f1
	snE+pMlCEBvd9/j0We+dYQ2u5g==
X-Received: by 2002:aa7:c3d9:0:b0:670:a401:c979 with SMTP id
 4fb4d7f45d1cf-67c1b2a359cmr2924519a12.25.1777901264447; Mon, 04 May 2026
 06:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn> <DH40Z14EHV40.1I443BTRU720F@linux.dev>
 <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com> <aeqF0EiP4b2Ycj2G@aurel32.net>
 <CANAwSgR-rJ0O9SJc92z05NVez6ZSfn9Gx8fJr3Be3QfCpR_XBA@mail.gmail.com> <ae4DJnPhTNZzah4p@aurel32.net>
In-Reply-To: <ae4DJnPhTNZzah4p@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 4 May 2026 18:57:26 +0530
X-Gm-Features: AVHnY4LvSGX9KJQ_zpkJ8g3O5orMWpRC0L2uRUpJ4l4yA0uiVwOduR_JLVWQGBY
Message-ID: <CANAwSgQc4adYK8xLqZd9FTcdv1FgVqjCNGeYoeqa5dNGg4pwBA@mail.gmail.com>
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
To: Anand Moon <linux.amoon@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Troy Mitchell <troy.mitchell@linux.dev>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_062747_473707_DDC64CA7 
X-CRM114-Status: GOOD (  33.69  )
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

SGkgQXVyZWxpZW4KCk9uIFN1biwgMjYgQXByIDIwMjYgYXQgMTc6NTEsIEF1cmVsaWVuIEphcm5v
IDxhdXJlbGllbkBhdXJlbDMyLm5ldD4gd3JvdGU6Cj4KPiBIaSBBbmFuZCwKPgo+IE9uIDIwMjYt
MDQtMjUgMjM6MTIsIEFuYW5kIE1vb24gd3JvdGU6Cj4gPiBIaSBBbGwsCj4gPgo+ID4gT24gRnJp
LCAyNCBBcHIgMjAyNiBhdCAwMjoyMSwgQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1cmVsMzIu
bmV0PiB3cm90ZToKPiA+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+IE9uIDIwMjYtMDMtMTYgMDg6
MTksIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gPiA+IEhpIFRyb3ksCj4gPiA+ID4KPiA+ID4g
PiBPbiAyMDI2LTAzLTE2IDI6MjMgQU0sIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gPiA+ID4gPj4g
SSB0aGluayB0aGUgcmVhc29uIHdlIGVuZGVkIHVwIHdpdGggdGhlICJ1bnNhZmUiIGltcGxlbWVu
dGF0aW9ucyBvZiB0aGUKPiA+ID4gPiA+PiByZWJvb3Qvc2h1dGRvd24gZnVuY3Rpb25zIGlzIHRo
YXQgb24gdGhlIGJhY2tlbmQgaXQgaXMgdXN1YWxseSBTQkkgU1JTVAo+ID4gPiA+ID4+IGNhbGxz
LCB3aGljaCBjYW4gcHJvdGVjdCBpdHNlbGYgZnJvbSBvdGhlciBDUFVzIGFuZCBpbnRlcnJ1cHRz
LiBTaW5jZSBvbgo+ID4gPiA+ID4+IEsxIHdlJ3JlIGdvaW5nIHRvIGJlIHBva2luZyBJMkMgZGly
ZWN0bHksIHdlIHJ1biBpbnRvIHRoZSBwcm9ibGVtCj4gPiA+ID4gPj4gZGVzY3JpYmVkIGFib3Zl
LiBTbyBhbGwgb2YgdGhlc2Ugc2hvdWxkIGRpc2FibGUgaW50ZXJydXB0cyBhbmQgc3RvcAo+ID4g
PiA+ID4+IG90aGVyIENQVXMgYmVmb3JlIGNhbGxpbmcgdGhlIGhhbmRsZXJzLCBhbmQgY2FuJ3Qg
YXNzdW1lIHRoZSBoYW5kbGVycwo+ID4gPiA+ID4+IGFyZSBhbGwgU0JJIFNSU1QuCj4gPiA+ID4g
PiBZZXMsIHdlIGNhbm5vdCBhc3N1bWUgdGhhdCBhbGwgcGxhdGZvcm1zIHJlbHkgb24gdGhpcy4K
PiA+ID4gPgo+ID4gPiA+IFdoeSBpc24ndCBLMSB1c2luZyB0aGUgU0JJIFNSU1QgZXh0ZW5zaW9u
PyBSZXNldHRpbmcgdGhlIHBsYXRmb3JtIGZyb20gUy1tb2RlCj4gPiA+ID4gZGlyZWN0bHkgY2F1
c2VzIHByb2JsZW1zIGlmIHlvdSBldmVyIHdhbnQgdG8gcnVuIGFub3RoZXIgc3VwZXJ2aXNvciBk
b21haW4gKGZvcgo+ID4gPiA+IGV4YW1wbGUgYSBURUUgb3IgRUZJIHJ1bnRpbWUgc2VydmljZXMp
LCB3aGljaCBtYXkgbmVlZCB0byBjbGVhbiB1cCBiZWZvcmUgYQo+ID4gPiA+IHN5c3RlbSByZXNl
dC4KPiA+ID4gPgo+ID4gPiA+IEFzIHlvdSBtZW50aW9uLCBvdGhlciBwbGF0Zm9ybXMgdXNlIHRo
ZSBzdGFuZGFyZCBTQkkgU1JTVCBpbnRlcmZhY2UsIGV2ZW50IGlmCj4gPiA+ID4gdGhleSBuZWVk
IHRvIHBva2UgYSBQTUlDIHRvIHBlcmZvcm0gYSBzeXN0ZW0gcmVzZXQuIElzIHRoZXJlIHNvbWV0
aGluZwo+ID4gPiA+IHByZXZlbnRpbmcgSzEgZnJvbSBmb2xsb3dpbmcgdGhpcyBwYXRoPwo+ID4g
Pgo+ID4gPiBJIHdlbnQgdGhpcyBwYXRoIGFuZCBzdWJtaXR0ZWQgYSBwYXRjaHNldCB0byBPcGVu
U0JJIG1haWxpbmcgbGlzdCBkb2luZwo+ID4gPiB0aGF0Ogo+ID4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vcGVuc2JpLzIwMjYwNDE5MTUwODU3LjI3MDU4NDMtMS1hdXJlbGllbkBhdXJlbDMy
Lm5ldC9ULyN0Cj4gPiA+Cj4gPiBJIGp1c3Qgd2FudGVkIHRvIGNoZWNrIGlmIHdlIGNhbiB1c2Ug
dGhlIGxhdGVzdCBPcGVuU0JJIGltYWdlIHdpdGgKPiA+IHZlbmRvciB1LWJvb3QgPwo+ID4gSWYg
c28sIGNhbiB5b3Ugc2hhcmUgdGhlIGRldGFpbHMgb2YgZmxhc2ggdGhlIHUtYm9vdCBhbmQgT3Bl
blNCSSBiaW5hcmllcz8gLgo+Cj4gVGhhdCBpcyBhIGdvb2QgcXVlc3Rpb24sIGFuZCBubyB0aGlz
IGRvZXNuJ3Qgd29yayBvdXQgb2YgdGhlIGJveC4KPgo+ID4gSSB3YXMgd29ya2luZyBvbiB0aGUg
d2F0Y2hkb2cgZHJpdmVyLCBhbmQgdGhlIHN5c3RlbSBoYW5ncyBhdCByZWJvb3QKPiA+IFNvLCB3
aGF0IGNoYW5nZXMgZG8gd2UgbmVlZCB0byBtYWtlIGluIE9wZW5TQkkgdG8gaGFuZGxlIHRoaXMg
aXNzdWU/Cj4KPiBUaGlzIGNhbiBiZSBhZGRyZXNzZWQgZWl0aGVyIGJ5IG1ha2luZyBPcGVuU0JJ
IGNvbXBhdGlibGUgd2l0aCB0aGUKPiB2ZW5kb3IgVS1Cb290LCBvciBieSBtYWtpbmcgdGhlIHZl
bmRvciBVLUJvb3QgY29tcGF0aWJsZSB3aXRoIHRoZQo+IHVwc3RyZWFtIE9wZW5TQkkuIE9uIG15
IHNpZGUsIEkgcHJlZmVyIHRoZSBsYXR0ZXIgb3B0aW9uIGFzIGl0IGFsc28KPiBrZWVwcyB0aGUg
dXBzdHJlYW0gT3BlblNCSSBjb21wYXRpYmxlIHdpdGggdGhlIChmdXR1cmUpIHVwc3RyZWFtIFUt
Qm9vdC4KPgo+IEkgaGF2ZSBqdXN0IHB1Ymxpc2hlZCBhIGJsb2cgcG9zdCBhYm91dCBob3cgdG8g
ZG8gdGhhdDoKPiBodHRwczovL2Jsb2cuYXVyZWwzMi5uZXQvdXBzdHJlYW0tb3BlbnNiaS1zcGFj
ZW1pdC1rMS5odG1sCj4KSeKAmXZlIGNvbXBsZXRlZCB0aGUgYnVpbGQg4oCUIHRoZSBZb2N0byBp
bWFnZSBjb21waWxlZCBzdWNjZXNzZnVsbHkgZnJvbQp5b3VyIEdpdCByZXBvc2l0b3J5LgoKVS1C
b290IFNQTCAyMDIyLjEwc3BhY2VtaXQtZ2M2ZjI3NDZjIChBdWcgMjAgMjAyNSAtIDE0OjUzOjM3
ICswMDAwKQpbICAgMC4zNzFdIEREUiB0eXBlIExQRERSNFgKWyAgIDAuMzcxXSBzZXQgZGRyIHR4
IG9kdCB0byA4MG9obSEKWyAgIDAuMzg2XSBscGRkcjRfc2lsaWNvbl9pbml0IGNvbnN1bWUgMTVt
cwpbICAgMC4zODddIENoYW5nZSBERFIgZGF0YSByYXRlIHRvIDI0MDBNVC9zClsgICAyLjE3Ml0g
IyMgQ2hlY2tpbmcgaGFzaChlcykgZm9yIGNvbmZpZyBjb25mLTEgLi4uIE9LClsgICAyLjE3NF0g
IyMgQ2hlY2tpbmcgaGFzaChlcykgZm9yIEltYWdlIG9wZW5zYmkgLi4uIE9LClsgICAyLjE3OV0g
IyMgQ2hlY2tpbmcgaGFzaChlcykgZm9yIEltYWdlIHVib290IC4uLiBPSwpbICAgMi4xODRdICMj
IENoZWNraW5nIGhhc2goZXMpIGZvciBJbWFnZSBmZHQtMSAuLi4gT0sKWyAgIDIuMTg5XSAjIyBD
aGVja2luZyBoYXNoKGVzKSBmb3IgSW1hZ2Uga2VybmVsLTEgLi4uIE9LClsgICAyLjIwNV0gIyMg
Q2hlY2tpbmcgaGFzaChlcykgZm9yIEltYWdlIGZkdC0yIC4uLiBPSwptbWNfbG9hZF9pbWFnZV9y
YXdfc2VjdG9yOiBtbWMgYmxvY2sgcmVhZCBlcnJvcgoKT3BlblNCSSB2MS44LjEKICAgX19fXyAg
ICAgICAgICAgICAgICAgICAgX19fX18gX19fXyBfX19fXwogIC8gX18gXCAgICAgICAgICAgICAg
ICAgIC8gX19fX3wgIF8gXF8gICBffAogfCB8ICB8IHxfIF9fICAgX19fIF8gX18gfCAoX19fIHwg
fF8pIHx8IHwKIHwgfCAgfCB8ICdfIFwgLyBfIFwgJ18gXCBcX19fIFx8ICBfIDwgfCB8CiB8IHxf
X3wgfCB8XykgfCAgX18vIHwgfCB8X19fXykgfCB8XykgfHwgfF8KICBcX19fXy98IC5fXy8gXF9f
X3xffCB8X3xfX19fXy98X19fXy9fX19fX3wKICAgICAgICB8IHwKICAgICAgICB8X3wKClBsYXRm
b3JtIE5hbWUgICAgICAgICAgICAgICA6IEJhbmFuYSBQaSBCUEktRjMKUGxhdGZvcm0gRmVhdHVy
ZXMgICAgICAgICAgIDogbWVkZWxlZwpQbGF0Zm9ybSBIQVJUIENvdW50ICAgICAgICAgOiA4ClBs
YXRmb3JtIEhBUlQgUHJvdGVjdGlvbiAgICA6IHBtcApQbGF0Zm9ybSBJUEkgRGV2aWNlICAgICAg
ICAgOiBhY2xpbnQtbXN3aQpQbGF0Zm9ybSBUaW1lciBEZXZpY2UgICAgICAgOiBhY2xpbnQtbXRp
bWVyIEAgMjQwMDAwMDBIegpQbGF0Zm9ybSBDb25zb2xlIERldmljZSAgICAgOiB1YXJ0ODI1MApQ
bGF0Zm9ybSBIU00gRGV2aWNlICAgICAgICAgOiBzcGFjZW1pdC1oc20KUGxhdGZvcm0gUE1VIERl
dmljZSAgICAgICAgIDogLS0tClBsYXRmb3JtIFJlYm9vdCBEZXZpY2UgICAgICA6IC0tLQpQbGF0
Zm9ybSBTaHV0ZG93biBEZXZpY2UgICAgOiAtLS0KUGxhdGZvcm0gU3VzcGVuZCBEZXZpY2UgICAg
IDogLS0tClBsYXRmb3JtIENQUEMgRGV2aWNlICAgICAgICA6IC0tLQpGaXJtd2FyZSBCYXNlICAg
ICAgICAgICAgICAgOiAweDAKRmlybXdhcmUgU2l6ZSAgICAgICAgICAgICAgIDogNDA3IEtCCkZp
cm13YXJlIFJXIE9mZnNldCAgICAgICAgICA6IDB4NDAwMDAKRmlybXdhcmUgUlcgU2l6ZSAgICAg
ICAgICAgIDogMTUxIEtCCkZpcm13YXJlIEhlYXAgT2Zmc2V0ICAgICAgICA6IDB4NTUwMDAKRmly
bXdhcmUgSGVhcCBTaXplICAgICAgICAgIDogNjcgS0IgKHRvdGFsKSwgMSBLQiAocmVzZXJ2ZWQp
LCAxMyBLQgoodXNlZCksIDUyIEtCIChmcmVlKQpGaXJtd2FyZSBTY3JhdGNoIFNpemUgICAgICAg
OiA0MDk2IEIgKHRvdGFsKSwgMTQ2NCBCICh1c2VkKSwgMjYzMiBCIChmcmVlKQpSdW50aW1lIFNC
SSBWZXJzaW9uICAgICAgICAgOiAzLjAKU3RhbmRhcmQgU0JJIEV4dGVuc2lvbnMgICAgIDoKdGlt
ZSxyZm5jLGlwaSxiYXNlLGhzbSxwbXUsZGJjbixmd2Z0LGxlZ2FjeSxkYnRyLHNzZQpFeHBlcmlt
ZW50YWwgU0JJIEV4dGVuc2lvbnMgOiBub25lCgpTaW5jZSBJIGRvbid0IGhhdmUgeW91ciBvcGVu
c2JpIHBhdGNoIGluIG15IGVtYWlsLgpQbGVhc2UgZmVlbCBmcmVlIHRvIGFkZApUZXN0ZWQtYnk6
IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KCiA+IFJlZ2FyZHMKPiBBdXJlbGll
bgo+Cj4gLS0KPiBBdXJlbGllbiBKYXJubyAgICAgICAgICAgICAgICAgICAgICAgICAgR1BHOiA0
MDk2Ui8xREREOEM5Qgo+IGF1cmVsaWVuQGF1cmVsMzIubmV0ICAgICAgICAgICAgICAgICAgICAg
aHR0cDovL2F1cmVsMzIubmV0CgpUaGFua3MKLUFuYW5kCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
