Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7F0F53D8B
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 19:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fgi3hQhTRG/Ih90sGqxmNpo0at8EnqRfHqlAdQd3B0=; b=0G5N/0v9lGlHqL
	4Y1vZ1kR84ly0OkoqsNzEWSzjuHOyLlXeAT0qMqQVU59cQru4TnbqFQ3zGcR/eNvhueomjOaXei49
	XvettjkyPtJlyWCIbxXkvWxTAWxaCaNOInEamcSxxe7ysXf039pO10gDp6nxPBMGEHZOc2Du5v5kw
	IBapoy6lIvveQKW/X3jtX5PsWS462a91UDG+bIIMVhw+u+q1XhUV1TSrSSBxdCaOkXW6sNBU81ZRA
	GeLKmCx7wwROQ0ipGpektsz2FjsfotcCoGTd/mkbk6kEMZ4NSZTklghna2fjnnjO+c2G/Zc4fyRrd
	gWNwg8T1qKZH2NMvIhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2E0U-00000004mg5-0p4d;
	Mon, 16 Mar 2026 19:53:42 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2E0R-00000004mfk-47mU
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 19:53:41 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-79a535e7c00so12415147b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 12:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773690818; cv=none;
        d=google.com; s=arc-20240605;
        b=HZGHbf6V75cJCWz2ma0p42f+oXE121XxYnVzDeYFGKpHh7idAjjhde0RX4qg72l8pu
         xOgg9sF3bmATLFN4d2PP6LAnYke5frXgFQ4B4EJ6EI3wjwpY8gZ+1C75MVrC/SeuSVzY
         SP25duvWbLJEtm5NEQoRKIu7sI1v6lSU8sw6PA9Uw9cO7Ra84N5KA606HEUP90Drg5xA
         YoCHs7/SXvGmMyAisi0jxbqkTGLC8/qrQcv5PI6mf6Jm5Xw7hhFok4OgERCuachTpZNg
         d8SQmWMjo9E0VlxyBeqgNZbCAW5BJScZruDFdkv28/cdkJnV52uH+BbIfsMaoG0Hy0d7
         Qrcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cfr/+KdWaNG7d26GP7p0CvuBKTKufLHHRbtv8HCrcI8=;
        fh=7+/4/qN8+7BisMvjnXTStmhHpXNHIoLkLAIqPDs8798=;
        b=OALwxvU3i43zFJkWecUxrcwJzZhyxeY8q1AZtnjbukH+FRq37tCAxhfe5CUajOUP+T
         2ujzjaJIGA7RH7TFPrUyVQnkDzApOcmGJWN/joR9RGpQ/3j2FTu6RRcNPDSm8nHQGK26
         TUP5TkF6hEELsmdzgi/1u0nuSvcVqThMIMuvbTNnG9DOio/MaeWg80BdFskTAh+XTAAb
         dIj96pNKaM/A5ixvhQ9ZjXkkcN+jZvlQRJ7FBFLEhe+v/mw4Y1soroHga91VzDfLEJC2
         2RapD1SswpcmaCH++JnWMr8idahYVnRO2h4J9sCbZ9Kh2D7pVfyQC/o45yF2+KfCE/Q7
         r5rg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773690818; x=1774295618; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfr/+KdWaNG7d26GP7p0CvuBKTKufLHHRbtv8HCrcI8=;
        b=LxrNsr2o99Kq//nQubyMcpM958f8BOSvzhNPKJcZPyMPDPYxlWjxZF/nXkpCemdGY2
         HeFwJAGTLe3PCgbOipbj55HGd0C7QGG5x3d5HL9ZPTtnlIHO7o+rM0JrTCo8yWgyWjm5
         8wSe/G5/IBj/7wGpzvC3qqYMrakmB0LZClNO2HAPaEpHECvJs/yQ/CJhWKrhaGEE2dMI
         I05RB7pYBmH1k/uvYjj84WhXnwEgmPATOkCuYoKLyUJYXx8qI8t+qjFtgG7Qbcu1LIqJ
         ySJiLgWxPKG0pFF5Rf96Ks4pjd206oP0e7+MOED2obmlsgXJh9rW7ZgYF4iP7E4AuDp8
         jEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690818; x=1774295618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cfr/+KdWaNG7d26GP7p0CvuBKTKufLHHRbtv8HCrcI8=;
        b=cN0GqHUGrY29m10yYL/VR55BrcTVsjDgBuKJ+/swkNe84aC9QCo53aDpoDUnA+rGXW
         Usy4PT5JvRECPzR+E4YrND4PBfQMRAN7gq+K3jf13GdilLhCqoRwBes3SsXHnIj7TXp1
         upXnFXTESL5dkan4QVa2NbtzgphOWdocCdjZVMtFjFzHcc9AlO+6glrCEBVoufjUpwBm
         U+amxUA8CNw+Aqy3643DCCddnUgcKbXCP2LGnq4q0Gl4WrsO3ptwofW+7J+DHTbPG2rn
         nX19egrAqlV63urne/c01Y5w8gNG+SWV0n1Q+F/rhTwpEmkEaMqcRkLTd79kZEEVirtA
         gSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+1TWHPTqIT66n81G9Ry8npcqe/E90GsKTqlW9JL7pJ3TgtDSfqALcw21htlvKci6NMBJXDC7G6xxETg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsJKHS95/y/CiNTC30ktcUl1ezcGDTiefqBK3ORrzxqa+IejGd
	7BeeYASKPkhcgQYRnBqua3napoPJ9/c6DBexiSsz8LTE6JdRWczQ98dtENbYiAfnKMi+wKcChkh
	cfUaurlbz2pAmkyDYL6/ZrbCK0CQsmZ4=
X-Gm-Gg: ATEYQzys8W+npeEfjjMaItyK1sM8EiGlvRiVf8jjOKFBBX6EZzQ++lk4Bp6CmKIq9KA
	jbJ3PWMXX5nI7S4ntBFaeVzAlaBJNFxNTAriJLFf3rtrAvweEbwrcbPifwgy3LkHr0SAYvgGwnD
	Ij24vZW6zGH638Rjc2+ESsCrPDfc4sbkglqyvsenGBkPxVuvferb7jpC2BuXp3QlYjuStKj3Mz4
	pc7owo2/hl7pWVHGr19YsFznIdcEWG69lcs1qvwS542X1jIhFrp4mIPxR7UvYl+tZ3BPTONvlND
	ZC3//dbpgKNtgmeWhw5XsTc=
X-Received: by 2002:a05:690c:6c0b:b0:79a:4317:395a with SMTP id
 00721157ae682-79a43175384mr64466277b3.2.1773690817924; Mon, 16 Mar 2026
 12:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260315-bpf-kmalloc-nolock-v3-1-91c72bf91902@outlook.com>
In-Reply-To: <20260315-bpf-kmalloc-nolock-v3-1-91c72bf91902@outlook.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 16 Mar 2026 12:53:27 -0700
X-Gm-Features: AaiRm51TRiU_TdEe_xqQj-pB0MImfrzcDdg1WNNiYNlT_5xOuouk70K7fxXMtb4
Message-ID: <CAMB2axN9xYPzAJVQVywx3sxYa5ViRxt2oktt1LFXsSD_XsuJrA@mail.gmail.com>
Subject: Re: [PATCH bpf v3] bpf: do not use kmalloc_nolock when !HAVE_CMPXCHG_DOUBLE
To: rsworktech@outlook.com
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, stable@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_125340_079694_76FC9A6A 
X-CRM114-Status: GOOD (  33.65  )
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

T24gU2F0LCBNYXIgMTQsIDIwMjYgYXQgOTowMuKAr0FNIExldmkgWmltIHZpYSBCNCBSZWxheQo8
ZGV2bnVsbCtyc3dvcmt0ZWNoLm91dGxvb2suY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJv
bTogTGV2aSBaaW0gPHJzd29ya3RlY2hAb3V0bG9vay5jb20+Cj4KPiBrbWFsbG9jX25vbG9jayBh
bHdheXMgZmFpbHMgZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCBsYWNrIGNtcHhjaGcxNmIuCj4gRm9y
IGV4YW1wbGUsIHRoaXMgY2F1c2VzIGJwZl90YXNrX3N0b3JhZ2VfZ2V0IHdpdGggZmxhZwo+IEJQ
Rl9MT0NBTF9TVE9SQUdFX0dFVF9GX0NSRUFURSB0byBmYWlscyBvbiByaXNjdjY0IDYuMTkga2Vy
bmVsLgo+Cj4gRml4IGl0IGJ5IGVuYWJsaW5nIHVzZV9rbWFsbG9jX25vbG9jayBvbmx5IHdoZW4g
SEFWRV9DTVBYQ0hHX0RPVUJMRS4KPiBCdXQgbGVhdmUgdGhlIFBSRUVNUFRfUlQgY2FzZSBhcyBp
cyBiZWNhdXNlIGl0IHJlcXVpcmVzIGttYWxsb2Nfbm9sb2NrCj4gZm9yIGNvcnJlY3RuZXNzLiBB
ZGQgYSBjb21tZW50IGFib3V0IHRoaXMgbGltaXRhdGlvbiB0aGF0IGFyY2hpdGVjdHVyZSdzCj4g
bGFjayBvZiBDTVBYQ0hHX0RPVUJMRSBjb21iaW5lZCB3aXRoIFBSRUVNUFRfUlQgY291bGQgbWFr
ZQo+IGJwZl9sb2NhbF9zdG9yYWdlX2FsbG9jIGFsd2F5cyBmYWlsLgoKTGV0J3Mgbm90IGRvIHRo
aXMuCgpUaGlzIHJlLWludHJvZHVjZXMgZGVhZGxvY2sgdG8gbG9jYWwgc3RvcmFnZS4gSW4gYWRk
aXRpb24sIGxvY2FsCnN0b3JhZ2Ugd2lsbCBzd2l0Y2ggdG8gdXNpbmcga21hbGxvY19ub2xvY2so
KSBlbnRpcmVseS4KCkZvciByaXNjdiBoYXJkd2FyZSB3aXRob3V0IHphY2FzIGV4dGVuc2lvbiwg
SSB0aGluayBhIHdvcmthcm91bmQgd2l0aApzb21lIHBlcmZvcm1hbmNlIG92ZXJoZWFkIGlzIHRv
IGVuYWJsZSBDT05GSUdfU0xVQl9ERUJVRyBhbmQKc2x1Yl9kZWJ1ZyBvcHRpb25zLgoKPgo+IEZp
eGVzOiBmNDg0ZjRhM2UwNTggKCJicGY6IFJlcGxhY2UgYnBmIG1lbW9yeSBhbGxvY2F0b3Igd2l0
aCBrbWFsbG9jX25vbG9jaygpIGluIGxvY2FsIHN0b3JhZ2UiKQo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogTGV2aSBaaW0gPHJzd29ya3RlY2hAb3V0bG9vay5j
b20+Cj4gLS0tCj4gSSBmaW5kIHRoYXQgYnBmX3Rhc2tfc3RvcmFnZV9nZXQgd2l0aCBmbGFnIEJQ
Rl9MT0NBTF9TVE9SQUdFX0dFVF9GX0NSRUFURQo+IGFsd2F5cyBmYWlscyBmb3IgbWUgb24gNi4x
OSBrZXJuZWwgb24gcmlzY3Y2NCBhbmQgYmlzZWN0ZWQgaXQuCj4KPiBJbiBmNDg0ZjRhM2UwNTgg
KCJicGY6IFJlcGxhY2UgYnBmIG1lbW9yeSBhbGxvY2F0b3Igd2l0aCBrbWFsbG9jX25vbG9jaygp
Cj4gaW4gbG9jYWwgc3RvcmFnZSIpLCBicGYgbWVtb3J5IGFsbG9jYXRvciBpcyByZXBsYWNlZCB3
aXRoIGttYWxsb2Nfbm9sb2NrLgo+IFRoaXMgYXBwcm9hY2ggaXMgcHJvYmxlbWF0aWMgZm9yIGFy
Y2hpdGVjdHVyZXMgdGhhdCBsYWNrIENNUFhDSEdfRE9VQkxFCj4gYmVjYXVzZSBrbWFsbG9jX25v
bG9jayBhbHdheXMgZmFpbHMgaW4gdGhpcyBjYXNlOgo+Cj4gSW4gZnVuY3Rpb24ga21hbGxvY19u
b2xvY2sgKGttYWxsb2Nfbm9sb2NrX25vcHJvZik6Cj4KPiAgICAgICAgIGlmICghKHMtPmZsYWdz
ICYgX19DTVBYQ0hHX0RPVUJMRSkgJiYgIWttZW1fY2FjaGVfZGVidWcocykpCj4gICAgICAgICAg
ICAgICAgIC8qCj4gICAgICAgICAgICAgICAgICAqIGttYWxsb2Nfbm9sb2NrKCkgaXMgbm90IHN1
cHBvcnRlZCBvbiBhcmNoaXRlY3R1cmVzIHRoYXQKPiAgICAgICAgICAgICAgICAgICogZG9uJ3Qg
aW1wbGVtZW50IGNtcHhjaGcxNmIsIGJ1dCBkZWJ1ZyBjYWNoZXMgZG9uJ3QgdXNlCj4gICAgICAg
ICAgICAgICAgICAqIHBlci1jcHUgc2xhYiBhbmQgcGVyLWNwdSBwYXJ0aWFsIHNsYWJzLiBUaGV5
IHJlbHkgb24KPiAgICAgICAgICAgICAgICAgICoga21lbV9jYWNoZV9ub2RlLT5saXN0X2xvY2ss
IHNvIGttYWxsb2Nfbm9sb2NrKCkgY2FuCj4gICAgICAgICAgICAgICAgICAqIGF0dGVtcHQgdG8g
YWxsb2NhdGUgZnJvbSBkZWJ1ZyBjYWNoZXMgYnkKPiAgICAgICAgICAgICAgICAgICogc3Bpbl90
cnlsb2NrX2lycXNhdmUoJm4tPmxpc3RfbG9jaywgLi4uKQo+ICAgICAgICAgICAgICAgICAgKi8K
PiAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4KPiBGaXggaXQgYnkgZW5hYmxpbmcgdXNl
X2ttYWxsb2Nfbm9sb2NrIG9ubHkgd2hlbiBIQVZFX0NNUFhDSEdfRE9VQkxFLgo+IChCdXQgbm90
IGZvciBhIFBSRUVNUFRfUlQgY2FzZSBhcyBleHBsYWluZWQgaW4gdGhlIGNvbW1lbnQgYW5kIGNv
bW1pdG1zZykKPgo+IE5vdGUgZm9yIHN0YWJsZTogdGhpcyBvbmx5IG5lZWRzIHRvIGJlIHBpY2tl
ZCBpbnRvIHY2LjE5IGlmIHRoZSBwYXRjaAo+IG1ha2VzIGl0IGludG8gNy4wLgo+IC0tLQo+IENo
YW5nZXMgaW4gdjM6Cj4gLSBVc2UgbWFjcm8gaW5zdGVhZCBvZiBjb25zdCBzdGF0aWMgdmFyaWFi
bGUgdG8gYXZvaWQgdHJpZ2dlcmluZwo+ICAgd2FybmluZ3MuCj4gLSBXcmFwIGxpbmVzIGF0IDgw
IGNvbHVtbnMKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAz
MTQtYnBmLWttYWxsb2Mtbm9sb2NrLXYyLTEtNTc2ZTMzZTRmYTY3QG91dGxvb2suY29tCj4KPiBD
aGFuZ2VzIGluIHYyOgo+IC0gRHJvcCB0aGUgbW9kaWZpY2F0aW9uIHRvIHRoZSBQUkVFTVBUX1JU
IGNhc2UgYXMgaXQgcmVxdWlyZXMKPiAgIGttYWxsb2Nfbm9sb2NrIGZvciBjb3JyZWN0bmVzcy4K
PiAtIEFkZCBhIGNvbW1lbnQgdG8gdGhlIFBSRUVNUFRfUlQgY2FzZSBhYm91dCB0aGUgbGltaXRh
dGlvbiB3aGVuCj4gICBub3QgSEFWRV9DTVBYQ0hHX0RPVUJMRSBidXQgZW5hYmxlcyBQUkVFTVBU
X1JULgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDMxNC1i
cGYta21hbGxvYy1ub2xvY2stdjEtMS0yNGFiZjNmNzVhOWZAb3V0bG9vay5jb20KPiAtLS0KPiAg
aW5jbHVkZS9saW51eC9icGZfbG9jYWxfc3RvcmFnZS5oIHwgMSArCj4gIGtlcm5lbC9icGYvYnBm
X2NncnBfc3RvcmFnZS5jICAgICB8IDMgKystCj4gIGtlcm5lbC9icGYvYnBmX2xvY2FsX3N0b3Jh
Z2UuYyAgICB8IDQgKysrKwo+ICBrZXJuZWwvYnBmL2JwZl90YXNrX3N0b3JhZ2UuYyAgICAgfCAz
ICsrLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2JwZl9sb2NhbF9zdG9yYWdlLmggYi9pbmNs
dWRlL2xpbnV4L2JwZl9sb2NhbF9zdG9yYWdlLmgKPiBpbmRleCA4MTU3ZThkYTYxZDQwLi5kOGYy
YzVkNjNhODBlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvYnBmX2xvY2FsX3N0b3JhZ2Uu
aAo+ICsrKyBiL2luY2x1ZGUvbGludXgvYnBmX2xvY2FsX3N0b3JhZ2UuaAo+IEBAIC0xOCw2ICsx
OCw3IEBACj4gICNpbmNsdWRlIDxhc20vcnFzcGlubG9jay5oPgo+Cj4gICNkZWZpbmUgQlBGX0xP
Q0FMX1NUT1JBR0VfQ0FDSEVfU0laRSAgIDE2Cj4gKyNkZWZpbmUgS01BTExPQ19OT0xPQ0tfU1VQ
UE9SVEVEIElTX0VOQUJMRUQoQ09ORklHX0hBVkVfQ01QWENIR19ET1VCTEUpCj4KPiAgc3RydWN0
IGJwZl9sb2NhbF9zdG9yYWdlX21hcF9idWNrZXQgewo+ICAgICAgICAgc3RydWN0IGhsaXN0X2hl
YWQgbGlzdDsKPiBkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9icGZfY2dycF9zdG9yYWdlLmMgYi9r
ZXJuZWwvYnBmL2JwZl9jZ3JwX3N0b3JhZ2UuYwo+IGluZGV4IGMyYTJlYWQxZjQ2NmQuLmNkMTgx
OTNjNDQwNTggMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2JwZi9icGZfY2dycF9zdG9yYWdlLmMKPiAr
KysgYi9rZXJuZWwvYnBmL2JwZl9jZ3JwX3N0b3JhZ2UuYwo+IEBAIC0xMTQsNyArMTE0LDggQEAg
c3RhdGljIGludCBub3RzdXBwX2dldF9uZXh0X2tleShzdHJ1Y3QgYnBmX21hcCAqbWFwLCB2b2lk
ICprZXksIHZvaWQgKm5leHRfa2V5KQo+Cj4gIHN0YXRpYyBzdHJ1Y3QgYnBmX21hcCAqY2dyb3Vw
X3N0b3JhZ2VfbWFwX2FsbG9jKHVuaW9uIGJwZl9hdHRyICphdHRyKQo+ICB7Cj4gLSAgICAgICBy
ZXR1cm4gYnBmX2xvY2FsX3N0b3JhZ2VfbWFwX2FsbG9jKGF0dHIsICZjZ3JvdXBfY2FjaGUsIHRy
dWUpOwo+ICsgICAgICAgcmV0dXJuIGJwZl9sb2NhbF9zdG9yYWdlX21hcF9hbGxvYyhhdHRyLCAm
Y2dyb3VwX2NhY2hlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBLTUFMTE9DX05PTE9DS19TVVBQT1JURUQpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgY2dyb3Vw
X3N0b3JhZ2VfbWFwX2ZyZWUoc3RydWN0IGJwZl9tYXAgKm1hcCkKPiBkaWZmIC0tZ2l0IGEva2Vy
bmVsL2JwZi9icGZfbG9jYWxfc3RvcmFnZS5jIGIva2VybmVsL2JwZi9icGZfbG9jYWxfc3RvcmFn
ZS5jCj4gaW5kZXggOWM5NmE0NDc3ZjgxYS4uYTZjMjQwZGE4NzY2OCAxMDA2NDQKPiAtLS0gYS9r
ZXJuZWwvYnBmL2JwZl9sb2NhbF9zdG9yYWdlLmMKPiArKysgYi9rZXJuZWwvYnBmL2JwZl9sb2Nh
bF9zdG9yYWdlLmMKPiBAQCAtODkzLDYgKzg5MywxMCBAQCBicGZfbG9jYWxfc3RvcmFnZV9tYXBf
YWxsb2ModW5pb24gYnBmX2F0dHIgKmF0dHIsCj4gICAgICAgICAvKiBJbiBQUkVFTVBUX1JULCBr
bWFsbG9jKEdGUF9BVE9NSUMpIGlzIHN0aWxsIG5vdCBzYWZlIGluIG5vbgo+ICAgICAgICAgICog
cHJlZW1wdGlibGUgY29udGV4dC4gVGh1cywgZW5mb3JjZSBhbGwgc3RvcmFnZXMgdG8gdXNlCj4g
ICAgICAgICAgKiBrbWFsbG9jX25vbG9jaygpIHdoZW4gQ09ORklHX1BSRUVNUFRfUlQgaXMgZW5h
YmxlZC4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBIb3dldmVyLCBrbWFsbG9jX25vbG9jayB3
b3VsZCBmYWlsIG9uIGFyY2hpdGVjdHVyZXMgdGhhdCBkbyBub3QKPiArICAgICAgICAqIGhhdmUg
Q01QWENIR19ET1VCTEUuIE9uIHN1Y2ggYXJjaGl0ZWN0dXJlcyB3aXRoIFBSRUVNUFRfUlQsCj4g
KyAgICAgICAgKiBicGZfbG9jYWxfc3RvcmFnZV9hbGxvYyB3b3VsZCBhbHdheXMgZmFpbC4KPiAg
ICAgICAgICAqLwo+ICAgICAgICAgc21hcC0+dXNlX2ttYWxsb2Nfbm9sb2NrID0gSVNfRU5BQkxF
RChDT05GSUdfUFJFRU1QVF9SVCkgPyB0cnVlIDogdXNlX2ttYWxsb2Nfbm9sb2NrOwo+Cj4gZGlm
ZiAtLWdpdCBhL2tlcm5lbC9icGYvYnBmX3Rhc2tfc3RvcmFnZS5jIGIva2VybmVsL2JwZi9icGZf
dGFza19zdG9yYWdlLmMKPiBpbmRleCA2MDU1MDY3OTJiNWI0Li42ZTg1OTdlZGVhMzE0IDEwMDY0
NAo+IC0tLSBhL2tlcm5lbC9icGYvYnBmX3Rhc2tfc3RvcmFnZS5jCj4gKysrIGIva2VybmVsL2Jw
Zi9icGZfdGFza19zdG9yYWdlLmMKPiBAQCAtMjEyLDcgKzIxMiw4IEBAIHN0YXRpYyBpbnQgbm90
c3VwcF9nZXRfbmV4dF9rZXkoc3RydWN0IGJwZl9tYXAgKm1hcCwgdm9pZCAqa2V5LCB2b2lkICpu
ZXh0X2tleSkKPgo+ICBzdGF0aWMgc3RydWN0IGJwZl9tYXAgKnRhc2tfc3RvcmFnZV9tYXBfYWxs
b2ModW5pb24gYnBmX2F0dHIgKmF0dHIpCj4gIHsKPiAtICAgICAgIHJldHVybiBicGZfbG9jYWxf
c3RvcmFnZV9tYXBfYWxsb2MoYXR0ciwgJnRhc2tfY2FjaGUsIHRydWUpOwo+ICsgICAgICAgcmV0
dXJuIGJwZl9sb2NhbF9zdG9yYWdlX21hcF9hbGxvYyhhdHRyLCAmdGFza19jYWNoZSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgS01BTExPQ19OT0xPQ0tfU1VQ
UE9SVEVEKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIHRhc2tfc3RvcmFnZV9tYXBfZnJlZShzdHJ1
Y3QgYnBmX21hcCAqbWFwKQo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IGUwNmU2YjgwMDEyMzMyNDFl
YjViMmUyNzkxMTYyZjA1ODVmNTBmNGIKPiBjaGFuZ2UtaWQ6IDIwMjYwMzE0LWJwZi1rbWFsbG9j
LW5vbG9jay02MGRhODBlNjEzZGUKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IExldmkgWmltIDxy
c3dvcmt0ZWNoQG91dGxvb2suY29tPgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
