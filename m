Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEC0CA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 01:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VcnHt3hA6qH3aJBUf3PriBvRkcfPIoR7i/OSCslDco=; b=bwvqpuQW8l2yVP
	BN5ZQMyNBppnVHl9yTWSEnQ8K4npNsY4rfV44H9eZ9RW+CnJLLj0S+h1S+wxnDBeyX+9qJuL78qDj
	YHDTw2Roz2lbdET0xX2I/TWwPsFNEayqr7SAiCJQDar2TGNdt5VFpgM3GhmCPKoXCmHBwc7jDl4PK
	xO7iFdFvP2pODcdXYcFgxrt7o0ejfXwfooXK40aAwqVrzt6XNiM02Lsyf9kLGNBFqNIdBiEhCeeFW
	WSXxYywrUCkq/mAm3VUFQebpfAzmEpoJQrtS1LSi9RJHA0wrC2+qhENq9oyww9/2rviCtUUC7G3mH
	/NirVnKNUP0ZLNoHz0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEcvS-00000003MHo-06c5;
	Thu, 08 Oct 2026 01:28:02 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEcvO-00000003MH4-3mAY
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 01:28:01 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6b0496f4bbcso2627763eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 18:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791422877; cv=none;
        d=google.com; s=arc-20260327;
        b=OKVpqjDiTt1SSEKoNErFenT48xRnhUShzDrhJsltak0bjehj24PmUZBmNal3jpp9lq
         8llMpiPTUoFNLtVm5xtnx2TnIFpzmeKFqaIABIPn3dP8SROyj4GPgSBaT7KAzhn7QLWG
         QW0qRkdlOb7M3DgiHgQPZISxqH0KhoeAo/U6Z6mH7rs/sojantVqmQM8Y8gxAMLWOvqg
         SNpg7kq/xMzjDrPdiQtfswpXuWHMkFp4y/q/mJmvxlXayfB1T0B+VKTgvuybZNYCMB/V
         YYNxsSF+a8mCXftCXsdXCobeDtHfAiSWG7paQho16P9jwmU15+2uOOfi6gWhWDb16EzX
         RxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zg4C20dlKhnfsVJfYBsUXxD+H8zQC9SUviz5Ibm52LI=;
        fh=ZMxxvgFgbH+gK49iPkGCus6enL3RhGTbItqCWOIp66E=;
        b=KLzPjaRLhoymxpAhv4JYGEgCwMrBqe8Bt5KGddICCq7whKW86fzJUtTHNx0RVuzdje
         w3HPzqzkvcY4YLQAGXEKn8I7q+tMBS0xCz/P7orNkyxatMfTYRNcWW4YClwjUSPo+Cbg
         eM5YYGabwCFJjtU9nVitO+Xi+Nt9bSMr2Nft8MUnpbJ83/0gS8pI6VEiyqiiEIPuGjaq
         TKCYlA48ThiSX4bgzBYxKNb10uN8pmqZO8feeyvy/EJ+mP4ozJSeMIHbDo99tiHrlStD
         W1Alkvs5ChHTruuUM50Dq7q7mzz/3zu22pfRUnYWswPduYF6D+jmRkhx+vUwgEO5U/yf
         lk1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791422877; x=1792027677; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zg4C20dlKhnfsVJfYBsUXxD+H8zQC9SUviz5Ibm52LI=;
        b=biVzGjcn3I5Zi+BaxEN5xfYXyy4Yd80SbgbotB2WCgU4pJ9PN6rhNx2DFg/1kOa6J+
         Qi1nU42M6MD20hIesKnKbjPOx9L3CTnR6+oFBlzHgnOFSosv2Tb/c9g37xeKYBK98GVg
         DWDj++eHOIrFEZ0LK4TUF0VYqFjKT+DrLpo7uqj20OBE7UIUXVO1FoTjhQzbjzj51arl
         1pXw/nNgowxQjIsFfQiclb5Zvnw4HQAzicl371Nsdx/0shgm6YkCWD3klBO8VDMRS0r/
         v4c0aEuwYRr+gBgRR+Vt2RrWwKD3VtEtPhFkgd45MsY6QT0LGh1cEbRML9oqXbImuM2n
         JNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791422877; x=1792027677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zg4C20dlKhnfsVJfYBsUXxD+H8zQC9SUviz5Ibm52LI=;
        b=ktXrt1SbPu/H06Mn4WHvB9bIWVqEm9VMcTLzfWeYpxrIHERyi01vYz3FNXVVt1xwnv
         AEj0gESRlDh8hgs0PALr/Br3bj5VhNCKvDuRnvRYMZ2r6ov5UV7VxXxUcnZ5Ga/PPvev
         jD77xG+5WLWrnsWo7957DKfKRTtfuYOFZHFE65Lc5pyAEML4AcHYI+BlR0ziFTbfsGVl
         og9g+G4TCcUKss3Pztng/6kBZlwRm3I3APLU9ZlcqoqggaBWLusbcsjPguvfIR9wS6mX
         DEoxDQP4e1zYjyImRk8GJHUHwwJ2m+fMmikvBfwNmX33zbU397HbY9Bt7/OnopIUhq7C
         hHKw==
X-Forwarded-Encrypted: i=1; AKwUvBybbticDQ4SftNKi7M/Fwgsa/d+3dO6rvUU+CDa3tYlHYNdx4C07VRUK0JseO6RsCKEjyb7pDOTWinybQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kT+Ii6nsPFmtLyy65SBIOCukR9xs2tKabLZsEOjdj2BmS0Pf9V
	BBB29TsIr9ANNUIriCsbKf0lPUq5IhEtmFCaD3bbs/uevrvu9uBqOxpcP23W40xGUFb7ddZ3f2J
	skonikje6rtkmuo30Av5vXvzbBiPzo860pE5LZebbGA==
X-Gm-Gg: AYBFou3lO+8P1MuUTKMRXGWcJJ+VqhlnZn9j7VDCYGOkaYtKOo+bbH3EigEjoLHs23w
	MYsx9m6w5J2BsAAvOA+r668WLaO569EQxzP3HsqDkTXilQiMhZACXUtrt/I+Amdh/L5D6URoppE
	kl3agj3j+CfuRzg3J/ywIdpnzjjjIlTuYxt9HtOIJQB/x3yDtlkie1oLAcWX+Idn3MZMci8JLKQ
	V/bGB7PT/XVOr6AUItej++HX4D0dROXLFoXzEPJm8i+RM7Q4iuNIxKmItIJCctP/Akkk+yDF6bh
	yklys1qLqOF7EJeeTxl0DWqWuOdXixAm9wB+K6CbeUJk6/DfPvEJ/ys0eg==
X-Received: by 2002:a05:6820:3381:10b0:6dd:6d12:22f7 with SMTP id
 006d021491bc7-6e7a2e43bc5mr2949743eaf.11.1791422877358; Wed, 07 Oct 2026
 18:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
 <CAJh9TSJWr8eLG=9_UjwdOqwUqfsCxaAJb8NUUJ9NKjnmPcLSPA@mail.gmail.com>
 <CAPx+jO9x304geo422e6PGNGPNsgSPAKcqUUyX244jOwy7fNw3w@mail.gmail.com>
 <CAJh9TSK0CJPWGFQYFcWmA4TqcZuDTdrmOduBzZHVgSQVomCZeg@mail.gmail.com> <CAJh9TS+nj4nv0qgYG-hUSZibsY2APXYx565TuXRd6OCkp81veQ@mail.gmail.com>
In-Reply-To: <CAJh9TS+nj4nv0qgYG-hUSZibsY2APXYx565TuXRd6OCkp81veQ@mail.gmail.com>
From: Jimmy Ho <jimmy.ho@sifive.com>
Date: Thu, 8 Oct 2026 09:27:45 +0800
X-Gm-Features: AclHuK_7LWemmrOiD7b8XKO6qvA8ricNspFZwc3i0W9KnanuwgPKjXJr38RzF5I
Message-ID: <CAJh9TSKjEM-sz_2AZOVQARsmpQa8xZtfZ7tEc8_TFTwpH4AznQ@mail.gmail.com>
Subject: Re: RISC-V genpd race in OSI mode (genpd domain power_off vs firmware
 suspend call)
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>, rafael@kernel.org, daniel.lezcano@linaro.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	ulfh@kernel.org, Greentime Hu <greentime.hu@sifive.com>, Kevin Shi <kevin.shi@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_182758_979502_11CAA0B3 
X-CRM114-Status: GOOD (  44.50  )
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

UGluZyBvbiB0aGlzIHF1ZXN0aW9uIGlmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uLiBUaGFua3Mh
CgpPbiBUaHUsIFNlcCAxMCwgMjAyNiBhdCAzOjQ04oCvUE0gSmltbXkgSG8gPGppbW15LmhvQHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gUGluZyBvbiB0aGlzIHF1ZXN0aW9uIGlmIHlvdSBoYXZlIGFu
eSBzdWdnZXN0aW9uLiBUaGFua3MhCj4KPgo+IE9uIE1vbiwgQXVnIDMxLCAyMDI2IGF0IDk6NTPi
gK9BTSBKaW1teSBIbyA8amltbXkuaG9Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSWYgSSB1
bmRlcnN0YW5kIGNvcnJlY3RseSwgeW91IGFyZSByZWZlcnJpbmcgdG8gYSBtZWNoYW5pc20gc2lt
aWxhciB0bwo+ID4gcHNjaV92YWxpZGF0ZV9zdGF0ZV9jb29yZGluYXRpb24gaW4gUFNDSS4KPiA+
IEhvd2V2ZXIsIHRoZXJlIGlzIGEgdGltZSB3aW5kb3cgYmV0d2VlbiB0aGUgZ2VucGQgY2FsbGlu
ZyB0aGUKPiA+IHBvd2VyX29mZiBjYWxsYmFjayBhbmQgdGhlIGFjdHVhbCBleGVjdXRpb24gb2YK
PiA+IHBzY2lfdmFsaWRhdGVfc3RhdGVfY29vcmRpbmF0aW9uLgo+ID4gRHVyaW5nIHRoaXMgd2lu
ZG93LCBhbm90aGVyIGNvcmUgY291bGQgd2FrZSB1cCwgZW50ZXIgTGludXgsIHR1cm4gdGhlCj4g
PiBjbHVzdGVyIGdlbnBkIGJhY2sgb24sCj4gPiBhbmQgY29tcGxldGUgaXRzIG93biBzdXNwZW5k
IHNlcXVlbmNlIGJlZm9yZSB0aGUgaW5pdGlhbCBjb3JlIGZpbmlzaGVzCj4gPiBzdXNwZW5kaW5n
Lgo+ID4gQ29uc2VxdWVudGx5LCB0aGUgaW5pdGlhbCBjb3JlIHJlbWFpbnMgdW5hd2FyZSB0aGF0
IGFub3RoZXIgY29yZSBoYWQKPiA+IHdva2VuIHVwIGR1cmluZyB0aGF0IGludGVydmFsLgo+ID4K
PiA+IEJlc3QgcmVnYXJkcwo+ID4gSmltbXkgSG8KPiA+Cj4gPiBPbiBGcmksIEF1ZyAyOCwgMjAy
NiBhdCA4OjU14oCvUE0gVWxmIEhhbnNzb24KPiA+IDx1bGYuaGFuc3NvbkBvc3MucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgNzowM+KAr0FN
IEppbW15IEhvIDxqaW1teS5ob0BzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFJl
c2VuZGluZyB0aGlzIGZvbGxvdy11cCB0byBVbGbigJlzIGN1cnJlbnQgYWRkcmVzcwo+ID4gPiA+
Cj4gPiA+ID4gT24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgMTI6NTbigK9QTSBKaW1teSBIbyA8amlt
bXkuaG9Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkgbGludXgtcG0s
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gV2UgaGl0IGEgcmFjZSBjb25kaXRpb24gaW52b2x2aW5nIGdl
bnBkJ3MgQ1BVIFBNIGRvbWFpbiAoT1NJLW1vZGUKPiA+ID4gPiA+IGhpZXJhcmNoaWNhbCBjcHVp
ZGxlLCBzaW1pbGFyIHRvIHRoZSBBUk0gUFNDSSBPU0kgbW9kZWwpIG9uIGEgUklTQy1WCj4gPiA+
ID4gPiBwbGF0Zm9ybSwgYW5kIHdvdWxkIGxpa2UgdG8gZ2V0IHlvdXIgb3BpbmlvbiBvbiB3aGV0
aGVyIHRoaXMgaXMgYQo+ID4gPiA+ID4gZ2VucGQtbGV2ZWwgaXNzdWUgYW5kIHdoYXQgdGhlIHBy
ZWZlcnJlZCBnZW5lcmljIGZpeCB3b3VsZCBsb29rIGxpa2UuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
QmFja2dyb3VuZAo+ID4gPiA+ID4gLS0tLS0tLS0tLQo+ID4gPiA+ID4gT2JzZXJ2ZWQgdGhpcyBp
c3N1ZSBvbiBxZW11IHBsYXRmb3JtCj4gPiA+ID4gPiBPbiBvdXIgU29DLCBkcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYyByZWdpc3RlcnMgYSBnZW5wZAo+ID4gPiA+ID4gbm90
aWZpZXIgdG8gc2F2ZS9yZXN0b3JlIHRoZSBTLW1vZGUgQVBMSUMgY29udGV4dDoKPiA+ID4gPiA+
Cj4gPiA+ID4gPiAgIGFwbGljX25vdGlmaWVyKCkKPiA+ID4gPiA+ICAgICBHRU5QRF9OT1RJRllf
UFJFX09GRiAtPiBhcGxpY19zYXZlKCkKPiA+ID4gPiA+ICAgICBHRU5QRF9OT1RJRllfT04gICAg
ICAtPiBhcGxpY19yZXN0b3JlKCkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBDUFVzIGFyZSBhdHRhY2hl
ZCB0byB0aGlzIGdlbnBkIHZpYSBkdF9pZGxlX2F0dGFjaF9jcHUoKSAoYXMgaW4KPiA+ID4gPiA+
IGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jLCBtaXJyb3JpbmcgY3B1aWRsZS1w
c2NpLmMpLiBXaGVuCj4gPiA+ID4gPiB0aGUgbGFzdCBDUFUgaW4gdGhlIGRvbWFpbiBnb2VzIGlk
bGUsIGdlbnBkX3Bvd2VyX29mZigpIGRlY2lkZXMgdGhlCj4gPiA+ID4gPiBkb21haW4gY2FuIGJl
IHR1cm5lZCBvZmYgKGJhc2VkIG9uIHRoZSAibm90X3N1c3BlbmRlZCIgY291bnQgY29tcHV0ZWQK
PiA+ID4gPiA+IHVuZGVyIGdlbnBkX2xvY2spLiBXaGVuIHRoZSBmaXJzdCBDUFUKPiA+ID4gPiA+
IHJlc3VtZXMsIGdlbnBkX3Bvd2VyX29uKCkgZGVjaWRlcyB0byB0dXJuIHRoZSBkb21haW4gYmFj
ayBvbiBhbmQgZmlyZXMKPiA+ID4gPiA+IEdFTlBEX05PVElGWV9PTiwgd2hpY2ggdHJpZ2dlcnMg
YXBsaWNfcmVzdG9yZSgpLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhvd2V2ZXIsIHRoZSBhY3R1YWwg
U0JJIEhTTSBzdXNwZW5kIGNhbGwgKHJpc2N2X3NiaV9oYXJ0X3N1c3BlbmQoKSwKPiA+ID4gPiA+
IHNpbWlsYXIgdG8gYSBQU0NJIENQVV9TVVNQRU5EIGNhbGwpIGlzICpub3QqIGlzc3VlZCBpbnNp
ZGUKPiA+ID4gPiA+IGdlbnBkX2xvY2suIGdlbnBkJ3MgcG93ZXJfb2ZmKCkgY2FsbGJhY2sgb25s
eSByZWNvcmRzIHdoaWNoIGRvbWFpbgo+ID4gPiA+ID4gaWRsZSBzdGF0ZSB3YXMgc2VsZWN0ZWQ7
IHRoZSByZWFsIGZpcm13YXJlIHN1c3BlbmQgY2FsbCBoYXBwZW5zIGxhdGVyLAo+ID4gPiA+ID4g
YXN5bmNocm9ub3VzbHksIG9uIGVhY2ggQ1BVJ3Mgb3duIGNwdWlkbGUgZW50ZXIgcGF0aAo+ID4g
PiA+ID4gKF9fc2JpX2VudGVyX2RvbWFpbl9pZGxlX3N0YXRlKCkpLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFRoZSByYWNlCj4gPiA+ID4gPiAtLS0tLS0tLQo+ID4gPiA+ID4gQmVjYXVzZSBvZiB0aGlz
IGdhcCBiZXR3ZWVuICJnZW5wZCdzIHNvZnR3YXJlIGRlY2lzaW9uIHRoYXQgdGhpcyBDUFUKPiA+
ID4gPiA+IGlzIGxhc3QtbWFuIC8gZmlyc3QtbWFuIiBhbmQgInRoZSBDUFUgYWN0dWFsbHkgaXNz
dWluZyB0aGUgZmlybXdhcmUKPiA+ID4gPiA+IHN1c3BlbmQvcmVzdW1lIGNhbGwiLCB3ZSBvYnNl
cnZlZCB0aGUgZm9sbG93aW5nIHNlcXVlbmNlCj4gPiA+ID4gPgo+ID4gPiA+ID4gMS4gQ1BVMCBy
ZXF1ZXN0cyBhIHN5c3RlbSBkb21haW4tbGV2ZWwgcG93ZXItZ2F0ZSAoZGVlcCBzbGVlcCwgdGVh
cnMgZG93biB0aGUKPiA+ID4gPiA+ICAgIHNoYXJlZCBTLW1vZGUgQVBMSUMgY29udGV4dCkgYW5k
IGhhbmRzIG9mZiB0byBmaXJtd2FyZS4KPiA+ID4gPiA+IDIuIEJlZm9yZSBDUFUwJ3MgcmVxdWVz
dCBpcyBwaHlzaWNhbGx5IGNvbXBsZXRlZCwgQ1BVMSB3YWtlcyB1cCwKPiA+ID4gPiA+ICAgIGdl
bnBkX3Bvd2VyX29uKCkgcnVucywgR0VOUERfTk9USUZZX09OIGZpcmVzLCBhcGxpY19yZXN0b3Jl
KCkgcnVucy4KPiA+ID4gPiA+IDMuIENQVTEgZ29lcyBpZGxlIGFnYWluLCBidXQgdGhpcyB0aW1l
IHN5c3RlbSBkb21haW4tbGV2ZWwgZ2VucGQgcmVqZWN0Cj4gPiA+ID4gPiAgICByZXF1ZXN0LCBz
byBpdCBmYWxsYmFjayB0byBjb3JlIGxldmVsIHBvd2VyLWdhdGUKPiA+ID4gPiA+IDQuIENQVTAn
cyBvcmlnaW5hbCBzeXN0ZW0gZGVlcCBwb3dlci1nYXRlIHJlcXVlc3QgZXZlbnR1YWxseSBjb21w
bGV0ZXMgYXQgdGhlCj4gPiA+ID4gPiAgICBmaXJtd2FyZSBsZXZlbCAtLSBwaHlzaWNhbGx5IGNv
bGxhcHNpbmcgdGhlIHN5c3RlbSBkb21haW4sIGluY2x1ZGluZyB0aGUKPiA+ID4gPiA+ICAgIFMt
bW9kZSBBUExJQyBjb250ZXh0LCBzYXZlZCBlYXJsaWVyIGJ5IGFwbGljX3NhdmUoKQo+ID4gPiA+
ID4gNS4gQ1BVMCB3YWtlcyB1cCAoZS5nLiBVQVJUIGludGVycnVwdCksIGVudGVycyBMaW51eCwg
YnV0IHN5c3RlbSBnZW5wZCdzCj4gPiA+ID4gPiAgICBzb2Z0d2FyZSBzdGF0ZSBzdGlsbCBzYXlz
IHRoZSBkb21haW4gaXMgIm9uIiAoZnJvbSBzdGVwIDIpLCBzbyBzeXN0ZW0gZG9tYWluCj4gPiA+
ID4gPiAgICBHRU5QRF9OT1RJRllfT04gd2lsbCBub3QgYmUgZmlyZWQgYWdhaW4gYW5kIGFwbGlj
X3Jlc3RvcmUoKSB3aWxsIG5vdCBiZQo+ID4gPiA+ID4gICAgY2FsbGVkCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhpcyBsb29rcyBzdHJ1Y3R1cmFsbHkgaWRlbnRpY2FsIHRvIHRoZSByYWNlIFRGLUEn
cyBQU0NJIE9TLWluaXRpYXRlZAo+ID4gPiA+ID4gbW9kZSBkb2N1bWVudGF0aW9uIGRlc2NyaWJl
czoKPiA+ID4gPiA+IGh0dHBzOi8vdHJ1c3RlZGZpcm13YXJlLWEucmVhZHRoZWRvY3MuaW8vZW4v
bGF0ZXN0L2Rlc2lnbl9kb2N1bWVudHMvcHNjaV9vc2lfbW9kZS5odG1sI3JhY2VzLWluLW9zLWlu
aXRpYXRlZC1tb2RlCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgIkluIE9TLWluaXRp
YXRlZCBtb2RlLCB0aGVyZSBhcmUgcmFjZSB3aW5kb3dzIHdoZXJlIHRoZSBPUydzIHZpZXcKPiA+
ID4gPiA+ICAgYW5kIGltcGxlbWVudGF0aW9uJ3MgdmlldyBvZiB0aGUgc3lzdGVtJ3Mgc3RhdGUg
ZGlmZmVyLi4uIHRoZSBPUwo+ID4gPiA+ID4gICBtaWdodCByZXF1ZXN0IGEgcG93ZXJkb3duIHN0
YXRlIGZvciBhIG5vZGUgZnJvbSBvbmUgY29yZSwgd2hpbGUgYXQKPiA+ID4gPiA+ICAgdGhlIHNh
bWUgdGltZSwgdGhlIGltcGxlbWVudGF0aW9uIG9ic2VydmVzIHRoYXQgYW5vdGhlciBjb3JlIGlu
Cj4gPiA+ID4gPiAgIHRoYXQgbm9kZSBpcyBwb3dlcmluZyB1cC4iCj4gPiA+ID4gPgo+ID4gPiA+
ID4gVEYtQSdzIGFuc3dlciBpcyB0byByZXF1aXJlIHRoZSBPUyB0byBlbmNvZGUgYSAibGFzdF9h
dF9wd3JsdmwiIGZpZWxkCj4gPiA+ID4gPiBpbnRvIHRoZSBTdGF0ZUlEIHBhc3NlZCB0byBDUFVf
U1VTUEVORCwgd2hpY2ggZmlybXdhcmUgdmFsaWRhdGVzCj4gPiA+ID4gPiBhZ2FpbnN0IGl0cyBv
d24gdmlldyBvZiBzeXN0ZW0gc3RhdGUgYmVmb3JlIGhvbm9yaW5nIGEgcG93ZXJkb3duCj4gPiA+
ID4gPiByZXF1ZXN0LiBXZSBjb3VsZCBub3QgZmluZCBhbnkgY29kZSBpbiBjdXJyZW50IG1haW5s
aW5lIExpbnV4Cj4gPiA+ID4gPiAoY3B1aWRsZS1wc2NpLmMgb3IgZ2VuZXJpYyBjcHVpZGxlL2dl
bnBkIGNvZGUpIHRoYXQgYWN0dWFsbHkgY29tcHV0ZXMKPiA+ID4gPiA+IGFuZCBlbmNvZGVzIHRo
aXMgZmllbGQgZHluYW1pY2FsbHkgcGVyIHN1c3BlbmQgY2FsbCwgc28gYXMgZmFyIGFzIHdlCj4g
PiA+ID4gPiBjYW4gdGVsbCB0aGlzIHJhY2UgaXMgdW5oYW5kbGVkIGdlbmVyaWNhbGx5IHRvZGF5
LCBvbiBib3RoIGFybS9wc2NpCj4gPiA+ID4gPiBhbmQgcmlzY3Yvc2JpIGJhY2tlbmRzLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IE9wdGlvbnMgd2UgY29uc2lkZXJlZAo+ID4gPiA+ID4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+ID4gPiA+ID4gMS4gSW1wbGVtZW50IHNvbWV0aGluZyBsaWtlIFBTQ0kn
cyBsYXN0X2F0X3B3cmx2bCBnZW5lcmljYWxseTogZXhwb3NlCj4gPiA+ID4gPiAgICBnZW5wZCdz
IGFscmVhZHktY29tcHV0ZWQgImFtIEkgdGhlIGxhc3QgQ1BVIGluIHRoaXMgZG9tYWluIgo+ID4g
PiA+ID4gICAgaW5mb3JtYXRpb24gdGhyb3VnaCB0aGUgcG93ZXJfb2ZmKCkgY2FsbGJhY2sgQVBJ
LCBzbwo+ID4gPiA+ID4gICAgYmFja2VuZHMgY2FuIHBhc3MgaXQgZG93biB0byBmaXJtd2FyZSwg
YW5kIGhhdmUgZmlybXdhcmUgdmFsaWRhdGUvCj4gPiA+ID4gPiAgICByZWplY3Qgc3RhbGUgcmVx
dWVzdHMuCj4gPiA+ID4gPiAgICAtIFBybzogbWF0Y2hlcyB0aGUgZG9jdW1lbnRlZCBQU0NJIE9T
SSBhcHByb2FjaC4KPiA+ID4gPiA+ICAgIC0gQ29uOiBXZSBkb24ndCBrbm93IGhvdyB0byBzZXQg
dGhpcyBmbGFnIHByb3Blcmx5IGluIGEgZ2VuZXJpYyB3YXkuCj4gPiA+ID4gPiAgICAgIGxhc3Rf
YXRfcHdybHZsIGlzIG9ubHkgbWVhbmluZ2Z1bCBvbiByaXNjdi9hcm0sIHNvIHdlIGNhbid0IGp1
c3QKPiA+ID4gPiA+ICAgICAgYWRkIGl0IHRvIGdlbnBkJ3MgZ2VuZXJpYyBjb2RlIHBhdGguIGdl
bnBkIGFsc28gZG9lc24ndCBrZWVwIGEKPiA+ID4gPiA+ICAgICAgY291bnRlciBvZiBob3cgbWFu
eSBDUFVzIGluIGEgZG9tYWluIGFyZSBzdGlsbCBhbGl2ZSwgc28gdGhlcmUncwo+ID4gPiA+ID4g
ICAgICBubyBleGlzdGluZyBzdGF0ZSBpbiBnZW5wZCdzIHBvd2VyX29mZigpIGNhbGxiYWNrIHdl
IGNvdWxkIHJlYWQKPiA+ID4gPiA+ICAgICAgdG8gZGVyaXZlIHRoZSBmbGFnLiBPbmUgaWRlYSB3
b3VsZCBiZSB0byB3YWxrIHRoZSBnZW5wZCBoaWVyYXJjaHkKPiA+ID4gPiA+ICAgICAgZnJvbSB3
aXRoaW4gdGhlIHBvd2VyX29mZigpIGNhbGxiYWNrIGFuZCBjaGVjayB0aGUgcnVudGltZV9zdGF0
dXMKPiA+ID4gPiA+ICAgICAgb2YgZWFjaCBDUFUgZGV2aWNlIGluIHRoZSBzYW1lIGRvbWFpbiAo
Z2VucGQgZG9tYWlucyBhbHJlYWR5IGNhcnJ5Cj4gPiA+ID4gPiAgICAgIGEgQ1BVIG1hc2ssIGFu
ZCBnZXRfY3B1X2RldmljZSgpIGNhbiBiZSB1c2VkIHRvIGxvb2sgdXAgdGhlCj4gPiA+ID4gPiAg
ICAgIGNvcnJlc3BvbmRpbmcgQ1BVIGRldmljZSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiAyLiBEbyB0
aGUgcG93ZXItZG9tYWluIGNvbnRyb2wgZGlyZWN0bHkgZnJvbSB0aGUgcG93ZXJfb2ZmKCkvcG93
ZXJfb24oKQo+ID4gPiA+ID4gICAgZ2VucGQgY2FsbGJhY2tzIChlLmcuIGhhdmUgdGhlbSBwb2tl
IHRoZSBTb0MncyBwb3dlciBjb250cm9sbGVyCj4gPiA+ID4gPiAgICByZWdpc3RlcnMgdmlhIGFu
IFNCSSBjYWxsLCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gZWFjaCBDUFUncyBvd24KPiA+ID4gPiA+
ICAgIGlkbGUtZW50cnkgcGF0aCB0byB0cmlnZ2VyIHRoZSBkZWVwZXN0IHN0YXRlKS4KPiA+ID4g
PiA+ICAgIGl0IGNyZWF0ZXMgdHdvIGluZGVwZW5kZW50IGRyaXZlciB0aGF0IHdpbGwgdG91Y2gg
cG93ZXIgY29udHJvbGxlcgo+ID4gPiA+ID4gICAgKG9wZW5zYmkgdnMgbGludXgpCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gMy4gSGF2ZSBlYWNoIENQVSBwYXNzIGEgbW9ub3RvbmljYWxseSBpbmNyZWFz
aW5nIHNlcXVlbmNlIG51bWJlcgo+ID4gPiA+ID4gICAgYWxvbmdzaWRlIGl0cyBzdXNwZW5kIHJl
cXVlc3QgdG8gZmlybXdhcmUsIGFuZCBoYXZlIGZpcm13YXJlCj4gPiA+ID4gPiAgICBpdHNlbGYg
ZGV0ZWN0IGFuZCByZWplY3QvZG93bmdyYWRlIGEgZGVlcCBwb3dlci1kb3duIHJlcXVlc3QgaWYg
YQo+ID4gPiA+ID4gICAgKm5ld2VyKiBzZXF1ZW5jZSBudW1iZXIgZnJvbSBhIHNoYWxsb3dlciAo
aS5lLiAic29tZSBDUFUgYmVjYW1lCj4gPiA+ID4gPiAgICBhY3RpdmUgYWdhaW4iKSByZXF1ZXN0
IGhhcyBiZWVuIG9ic2VydmVkIGZvciB0aGUgc2FtZSBkb21haW4gc2luY2UuCj4gPiA+ID4gPiAg
ICBUaGlzIGlzIGEgZmlybXdhcmUtc2lkZSBzdGFsZW5lc3MgY2hlY2ssIGVudGlyZWx5IGJlbG93
IHRoZSBTQkkKPiA+ID4gPiA+ICAgIGNhbGwgYm91bmRhcnkKPiA+ID4gPiA+ICAgIHRoaXMgc2Vx
IG51bWJlciBjYW4gYmUgbWFpbnRhaW5lZCBpbiBnZW5kcGQgZ2VuZXJpYyBjb2RlCj4gPiA+ID4g
PiAgICBvciByaXNjdiBwb3dlcl9vZmYoKSBjYWxsYmFjaywgd2hlcmUgZG8geW91IHN1Z2dlc3Qg
dGhpcyB0byBiZQo+ID4gPiA+ID4gICAgYWRkZWQ/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRG8geW91
IGhhdmUgYW55IHN1Z2dlc3Rpb24gdG8gc29sdmluZyB0aGlzIGlzc3VlPwo+ID4gPiA+ID4gVGhh
bmtzLAo+ID4gPiA+ID4gSmltbXkgSG8KPiA+ID4KPiA+ID4gVGhlIHByb2JsZW0gc2VlbXMgdmVy
eSBzaW1pbGFyIHRvIHRoZSByYWNlIGNvbmRpdGlvbiB3ZSBoYXZlIGZvciB0aGUKPiA+ID4gUFND
SSBPU0kgbW9kZS4gVGhpcyByYWNlIGNvbmRpdGlvbiBuZWVkcyB0byBiZSBtYW5hZ2VkIGluIHRo
ZSBGVy4KPiA+ID4KPiA+ID4gSWYgdGhlIGxhc3QgQ1BVIGluIGEgY2x1c3RlciBpcyBhYm91dCB0
byBlbnRlciBpZGxlLCB0aGUgRlcgc2ltcGx5Cj4gPiA+IG5lZWRzIHRvIGFib3J0IHRoZSByZXF1
ZXN0IGZvciBpdCwgaWYgdGhlcmUgaXMgYW5vdGhlciBDUFUgaW4gdGhlIHNhbWUKPiA+ID4gY2x1
c3RlciB0aGF0IGlzIGFib3V0IHRvIHdha2UgdXAuCj4gPiA+Cj4gPiA+IEtpbmQgcmVnYXJkcwo+
ID4gPiBVZmZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
