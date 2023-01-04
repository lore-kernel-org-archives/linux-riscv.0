Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DF8C53210
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEeX10hva/8HYfT7ZEhUgT/GFjVyCk7a2pRqlUXeqgY=; b=gsPy/Rxm0dE3Jy
	FmYG0JmAFjMSnbJjjsLNCWlaQvlqo9KdszKGJ1aOUbJAKNavtpHEQWmCENbtfuhw48pcHvPDG+eWY
	Zw9f32o+vjMfX1FH3eckqdu7PPcoULiH3ReEkl1meW6bBhtcLvY4/0ZvBNKWeOjtg7O4pLOWoRhul
	0FH48UXS0sP6Ge6u11tRwtXEDlkquToPwe+GFCB3B6jxQVdhCMXXxDdpHfTOagcE4ozV33URoJk/Q
	nyIjgkkC8Pyit1pB2VFsDkYpPQbrATPqs9qodF3RPybmcoNLeHgAFW6yCVibMdZsmfS5iNIdKBAjq
	TncvNKLxqLRsWy0w0iiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDBSl-00CDbi-F7; Wed, 04 Jan 2023 21:38:19 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDBSf-00CDZl-NR
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 21:38:17 +0000
Received: by mail-il1-x132.google.com with SMTP id u8so20151721ilq.13
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 13:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZjvACipyW+kfRXXX+ecbaA5spgW4jYeTs+sqkargLc=;
        b=BcVf880cxpZVL3hD/o9rRH7s7SiFpCgcJuWUUK5Fp9ln+KRb4tBDR8KddW/AN9ir7i
         3D+6cCgSx463Vh9uQY7Vmfe/8rg37497lBOZp69hjZm/j22KM4xYo2xZP1KBxcGzlP65
         paApSGntvFe+evOMrMt9e1zQjkIKtPIwCvY+/lrC4ycFEY5nLjfwgxeQIldEUYaissSt
         KFA5wpq8+YDNetdFOQ6SBoj9unpneR7n7+Iyfo18NEb3DQc2OTlaCfWsWKxcj2qeTW1H
         Bv+OA0UOhO4foSESWPYK98D9sG5r2L4vViPBAREr1bqjfoSIW98jKUic6QJ/R6Nq95M9
         BMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZjvACipyW+kfRXXX+ecbaA5spgW4jYeTs+sqkargLc=;
        b=miWuYH9Ug4u6lxydSTHhA+86oko/xNxG38F5TZab/L/3FUV7gKVize5sMutVUKjOyy
         IEF4hTwwEfvoXIQpxrEIQ7aBU3r1Boyg5+6uI+RDuCh2dxGYAlo+rdbpwcsnx939Zbi9
         v0pud85ME0QAfh1DTnsgDIPbhU+uPtzH4xv2JrEZ9aiTm8baIRnS59LjRXgSIK2qTkZ/
         joCIyTRMtN8q4phDvvTQno7useU1yaAzkks0bnHf81y+NCl/eWV5IjTcX/oPIBTzSTyh
         yTtw0xganOlNPBxMLP4tiC3c1zgR/OSWtunEddBuLm3/noAqdIRfO66zplK1bUHjFEez
         DT8Q==
X-Gm-Message-State: AFqh2krkdO46R5bacC01gc7pXGX+hTO5cJ/rRF9jGlhFEUkPSU6y2uP5
	hOK7OMMH4JZlktkwGoXzks086aEx/6Zj0Wnq+C5X4AJx7CqAINtOYyVXa88Nc5GTUvXdiocv/Pz
	asvgPTl83iKqI2x0j61hCdcHHM9RjKJBRSqIGiqZqcIf8MtMvtQmc/QT1KLxIXvgcDtjJ8TYTrP
	pnzwJRfw==
X-Google-Smtp-Source: AMrXdXtfoZ39ugrF05fREMCHnZ3orMLSvSawUi9YPzwu6xZAMbv3Ol5zNxcachu6C0HXrfdX8wvJtQ==
X-Received: by 2002:a05:6e02:b2a:b0:30d:6de3:2683 with SMTP id e10-20020a056e020b2a00b0030d6de32683mr3704831ilu.20.1672868285480;
        Wed, 04 Jan 2023 13:38:05 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id c12-20020a92c8cc000000b003039a19a927sm11044448ilq.7.2023.01.04.13.38.04
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 13:38:04 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id h26so5915136ila.11
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 13:38:04 -0800 (PST)
X-Received: by 2002:a92:cd0f:0:b0:303:19d2:9def with SMTP id
 z15-20020a92cd0f000000b0030319d29defmr4436974iln.21.1672868283710; Wed, 04
 Jan 2023 13:38:03 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com> <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com> <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com> <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
In-Reply-To: <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
From: Andrew Waterman <andrew@sifive.com>
Date: Wed, 4 Jan 2023 13:37:51 -0800
X-Gmail-Original-Message-ID: <CA++6G0C7Daq-TXhP2UFRhtJBwFmjbgxAwV=2pUYf=zBugtZz-A@mail.gmail.com>
Message-ID: <CA++6G0C7Daq-TXhP2UFRhtJBwFmjbgxAwV=2pUYf=zBugtZz-A@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Vineet Gupta <vineetg@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_133816_341737_5CFA6C7E 
X-CRM114-Status: GOOD (  30.28  )
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

T24gV2VkLCBKYW4gNCwgMjAyMyBhdCAxOjI5IFBNIFBoaWxpcHAgVG9tc2ljaCA8cGhpbGlwcC50
b21zaWNoQHZydWxsLmV1PiB3cm90ZToKPgo+IE9uIFdlZCwgNCBKYW4gMjAyMyBhdCAyMTo0Niwg
VmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4KPiA+Cj4g
PiBPbiAxLzQvMjMgMDg6MzQsIEFuZHkgQ2hpdSB3cm90ZToKPiA+ID4gSGkgVmluZWV0LAo+ID4g
Pgo+ID4gPiBPbiBXZWQsIEphbiA0LCAyMDIzIGF0IDM6MTcgQU0gVmluZWV0IEd1cHRhIDx2aW5l
ZXRnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+PiBUaGUgcHJjdGwgc3VwcG9ydCBpbiB0aGVy
ZSBpcyByZWFsbHkgcnVkaW1lbnRhcnkgYW5kIGluY29tcGxldGUuIFRoZXJlJ3MKPiA+ID4+IG1v
cmUgd29yayBuZWVkZWQgdG8gdXNlIHRoZSBkeW5hbWljIHN0YXRlIG9mIGVuYWJsZW1lbnQgLSBm
b3Igc2F5IHNpZ25hbAo+ID4gPj4gZnJhbWUgZXRjLgo+ID4gPiBZZXMsIEkgYWdyZWUgdGhhdCBz
aWduYWwgYW5kIHB0cmFjZSBuZWVkIHNwZWNpYWwgaGFuZGxpbmcgaWYgd2UnZCB0dXJuCj4gPiA+
IG9mZiBWZWN0b3Igd2l0aCBwcmN0bC4gRm9yIGV4YW1wbGUsIHdlIG1heSBub3QgbmVlZCB0byBz
YXZlL3Jlc3RvcmUKPiA+ID4gdmVjdG9yIGNvbnRleHQgb24gY29udGV4dCBzd2l0Y2hlcyBhbmQg
c2lnbmFsIGhhbmRsaW5ncy4gQW5kIHdlIG1heQo+ID4gPiBoYXZlIHRvIHByZXZlbnQgcHRyYWNl
IGZyb20gc2V0dGluZy9nZXR0aW5nIHZlY3RvciBjb250ZXh0IGluIHN1Y2gKPiA+ID4gY2FzZS4g
SSBjYW4gaW1wbGVtZW50IHRoaXMgaW50byB0aGUgc2VyaWVzIGlmIHRoaXMgaXMgd2hhdCB5b3Un
cmUKPiA+ID4gbG9va2luZyBmb3IuCj4gPgo+ID4gUGVyZmVjdC4gVGhpcyBpcyBleGFjdGx5IHRo
ZSBjb3ZlcmFnZSBJIHdhcyBob3BpbmcgdG8gc2VlLiBHbyBmb3IgaXQuCj4gPgo+ID4gPj4gVGhl
IG5ldyBLY29uZmlnIENPTkZJR19SSVNDVl9WU1RBVEVfSU5JVF9BTEwgc2VlbXMgbGlrZSBhCj4g
PiA+PiBoYWNrIGJvbHRlZCBvbiB0b3AuCj4gPiA+IElJVUMsIG1vc3Qgb3BpbmlvbnMgc3VnZ2Vz
dGVkIHRoYXQgd2Ugc2hvdWxkIGtlZXAgdGhlIGRlZmF1bHQgVmVjdG9yCj4gPiA+IHN0YXRlIHRv
IE9OIGluIHRocmVhZDoKPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwOTIx
MjE0NDM5LjE0OTE1MTAtMTctc3RpbGxzb25Acml2b3NpbmMuY29tL1QvI3UKPiA+Cj4gPiBBY3R1
YWxseSBjb21tdW5pdHkgZmVlZGJhY2sgaXMgdGhhdCB0aGV5ICpkb24ndCAqIHdhbnQgdGhlIGRl
ZmF1bHQKPiA+IHZlY3RvciBzdGF0ZSB0byBiZSBvbiBkdWUgdG8gcG93ZXIgaW1wbGljYXRpb25z
LCBpbmNyZWFzZWQgc3RhY2sgYW5kCj4gPiBtZW1vcnkgdXNhZ2UgZm9yIHZlY3RvciBjb250ZW50
cyAoaW4gdGhhdCB0aHJlYWQgYW5kIGVsc2Ugd2hlcmUgYXMKPiA+IHdlbGwpLiBTbyB3ZSBzaG91
bGQga2VlcCBpdCBkaXNhYmxlZCBieSBkZWZhdWx0LCBidXQgaW5kZWVkIHdlIGNvdWxkCj4gPiBo
YXZlIHRoYXQgS2NvbmZpZyBvcHRpb24gdG8gZW5hYmxlIGl0LiBHcmFudGVkIGRpc3RybyBrZXJu
ZWxzIHdpbGwga2VlcAo+ID4gaXQgZGlzYWJsZWQgYnkgZGVmYXVsdCwgdGhpcyBsZXRzIHZlbmRv
cnMgZW5hYmxlIGl0IHNlbGVjdGl2ZWx5IHVudGlsCj4gPiB0aGUgZnVsbCB1c2Vyc3BhY2UgZW5h
YmxpbmcgYml0cyBhcmUgaW4gcGxhY2UuCj4KPiBTaG91bGQgd2UgcHVudCB0aGlzIHRvIHRoZSBF
TEYgKGUuZy4sIHVzaW5nIGEgUklTQy1WIHNwZWNpZmljCj4gYXR0cmlidXRlKSBhbmQgdGFrZSBh
IHBlci1wcm9jZXNzIGRlY2lzaW9uIG9uIHdoZXRoZXIgdG8gc3RhcnQgaW4gT04KPiBvciBPRkY/
Cj4gSSBkb24ndCBmZWVsIGZ1bGx5IGNvbWZvcnRhYmxlIHdpdGggYSBLQ09ORklHIHRoYXQgY291
bGQgY2hhbmdlIGFuZAo+IGludmFsaWRhdGUgdGhlIGFzc3VtcHRpb25zIGEgdXNlcnNwYWNlIHBy
b2Nlc3MgY291bGQgaGF2ZSBtYWRl4oCmCgpJIGFtIHN1cHJlbWVseSBjb25maWRlbnQgd2Ugd2ls
bCBldmVudHVhbGx5IGhhdmUgdXNlcnNwYWNlIHRoYXQKdW5jb25kaXRpb25hbGx5IHdhbnRzIFYg
KGZvciBvcHRpbWl6ZWQgQyBsaWJyYXJ5IHJvdXRpbmVzIGF0IG1pbmltdW0pLAphbmQgdGhhdCBp
dCB3aWxsIGZvbGxvdyB2ZXJ5IGNsb3NlbHkgb24gdGhlIGhlZWxzIG9mIFYgYmVjb21pbmcKbWFp
bnN0cmVhbS4gIFNvLCB5b3VyIHByb3Bvc2FsIHRvIGVtYmVkIHRoaXMgaW5mb3JtYXRpb24gaW4g
dGhlIEVMRgpoZWFkZXIgKHNvIHRoYXQgdGhlIGtlcm5lbCBjYW4gZW5hYmxlIFYgYXV0b21hdGlj
YWxseSBvbiBwcm9ncmFtIGxvYWQsCm9yIHNvIHRoZSBkeW5hbWljIGxvYWRlciBjYW4gZXhlY3V0
ZSB0aGUgYHByY3RsYCBjYWxsIG9uIGxpYnJhcnkgbG9hZCwKb3Igd2hhdGV2ZXIpIHNlZW1zIG1v
cmUgZm9yd2FyZC1sb29raW5nIHRvIG1lIHRoYW4gbWFraW5nIHRoaXMgYQpLY29uZmlnIG9wdGlv
bi4KCj4KPiBBbHRlcm5hdGl2ZWx5LCB3ZSBjb3VsZCBlc3RhYmxpc2ggdGhlIGNvbnZlbnRpb24g
b2YgaGF2aW5nIHR3byBzdHViCj4gbGlicmFyaWVzIHRoYXQgc2V0IHVwIGVpdGhlciBlbmFibGVk
IG9yIGRpc2FibGUgc3RhdGUgZnJvbSB0aGVpcgo+IC5pbml0X2FycmF5IHRvIHByb3ZpZGUgYSBt
ZWNoYW5pc20gZm9yIGZvbGtzIHRoYXQgd2FudCB0byBtYWtlIGFuCj4gZXhwbGljaXQgYXNzdW1w
dGlvbi4gIEFsdGhvdWdoIHRoaXMgbWF5IHRyeSB0byBvdmVyZGVzaWduIGEgc29sdXRpb24KPiBm
b3IgYSBub24taXNzdWUuCj4KPiBQaGlsaXBwLgo+Cj4gPgo+ID4gPiBTbyBJTUhPIGFkZGluZyBh
IGJ1aWxkIG9wdGlvbiB0byB0aG9zZSB3aG8gcHJlZmVyIG5vdCB0bwo+ID4gPiB1bmNvbmRpdGlv
bmFsbHkgZW5hYmxlIFYgc2hvdWxkIGJlIHN1ZmZpY2llbnQuCj4gPgo+ID4gQXMgYWJvdmUsIGl0
IHNob3VsZCBiZSBvdGhlciB3YXkgcm91bmQuCj4gPgo+ID4gVGh4LAo+ID4gLVZpbmVldAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
