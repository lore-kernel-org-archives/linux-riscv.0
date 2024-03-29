Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7430CCD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjS8ZUOxkjVha7eN/C9HBMQiwmqjPu9jWnnlXaPd7ck=; b=1zrpgo8zrK3CAE
	Y+5KJGQdAPvih2sFVS3h8+U5ESicXu70dGpZ7ZsZVTlXI3RzSqkaqyt8y5m/ykEmgIy6cgogou8mW
	EJPjowNtbX/kBSAYfgppB5DwvNXwdZULDH4QLKknfO6g0ium8644Ov9GFw4HlNGOjTfp9YW9HvVjV
	raadvotXZcwoyAVikbLa2pgnAiPKpiNfBIMSiZbeItwwH+3GUwzbrBdBAtltH5Lr8eDtW+w02k4mR
	8MuDuVZF/B1AVhtxioisQX/0eI9imruvHS6Uns1YIiHLTq8/IIZlBcs6SHnyZd3GkI043Zm+ww7Du
	0o0lBjA1dxjh+DiYu4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqAKG-00000000Aoa-0tbH;
	Fri, 29 Mar 2024 11:23:12 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqAKC-00000000Amo-2FAk
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 11:23:10 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ead4093f85so1819224b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 04:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1711711383; x=1712316183; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VG9FSoxp06pKdGlIyq1RnBYkty3H778XglBDZVVqkfI=;
        b=RGkGH34VEKw9+Hg6iiHF7R9hDuTegozhJb9CyOndtzQspNl8ljdCqUdkgtnDs16DH9
         yH1/Bvo5/CNNVbMttFs5y7li+hpQLFHWv7zuGsXtLEH2OIUU+MZsE+Dpn9HSbVg0BLlS
         7NFcRB/+mw6rPk3qngyCJx08HUVRUQo+Xzd1XPZ3hQ77xk7sIFRjQSpMWakxe2mHrNBg
         c6dz8abNSEsxBT0gy2LVi3UfXmrUeEiNNnL+v+M+rcFVR7ApDhPJwS2QR0jQip81jWUt
         pkNcAw76+Jn7/lJk/xPpqv6jtzavhpXSjy5/uJ0cV6OnzmcLW3lAPrw46oPOenrv/s6k
         ETaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711711383; x=1712316183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VG9FSoxp06pKdGlIyq1RnBYkty3H778XglBDZVVqkfI=;
        b=sT8FKODmM5seW21eJqaLdtCKKR54jb6xE99yAOHDhsl1yJGxyjRqSxwsPlMxtkoCAo
         W/81MHlN5lKalaovGb7/dZR+nkMlcAIRf5l4ETfyY0kkmUDws95LE1chayS2++Swae6S
         JAafnPaFFmyCdi5YUpcFC0k/AxKfOXlx4HHRj0MgjGcRnjoIzO3xJHZdlbnyObZknMrY
         /JKGvqnH5B6y7Ag4BcEYzCYhPaUWRcv2kstf1Fkmy5AWEVpP29DD24V8SniTcHJHC1zw
         gblsf1E6hHHEiC73YxVf5H+P2XkpCmposYzOL96SbOEFjjmw836NbLQwXfj1o2PbDbO9
         xS0g==
X-Forwarded-Encrypted: i=1; AJvYcCX2L6GhGosZzFsM8wSLJvgFMr6OAMhKWYUIOWOO4K/HJY8XeeKA3KlGLVpddn8ZLV4XVTAUrZVfXQXdXzVnYGL1Os/+oeZWjtI6AzssXYRm
X-Gm-Message-State: AOJu0YyUeqsDeb1GKuUa08n9VRYBkF4KAdLGPawEAb+i+tqTzS4zPCR3
	aPBZoopCDNhmC7TePnr0c6LH0X+m/t8X74KoJhXgnaxfq5aEUFI2B543NeSccP6q7yR/Z/d8JMj
	jgNV1qqhE4GZfmSePz3n7uYHcoj/1oBa336ipHg==
X-Google-Smtp-Source: AGHT+IEZdgnHcsiUx6ukMKlm+aGQgbvDdTs4sCVIirJYDruCC4qjw3N7xkUnCSbgr0bp+M5X+9drU+PJwcI8TdnrT/4=
X-Received: by 2002:a05:6a21:9998:b0:1a5:6c6d:b1e0 with SMTP id
 ve24-20020a056a21999800b001a56c6db1e0mr1910892pzb.8.1711711382827; Fri, 29
 Mar 2024 04:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
 <20240327103130.3651950-3-christoph.muellner@vrull.eu> <20240327-imperfect-washbowl-d95e57cef0ef@spud>
 <20240327-77a6b64153a68452d0438999@orel> <CAEg0e7jyGZV3+04HNYzgfHMGYT9wV_c0A=ekpCRi3L-5yjxK=w@mail.gmail.com>
 <7354b054-9eda-45a6-9503-ff30a1c9c276@ghiti.fr>
In-Reply-To: <7354b054-9eda-45a6-9503-ff30a1c9c276@ghiti.fr>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 29 Mar 2024 12:22:51 +0100
Message-ID: <CAEg0e7iAUWgT9BfaBQiKg6RUCL7RvCq43+ShpbGU7bxWuTYtag@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: T-Head: Test availability bit before enabling
 MAEE errata
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	Cooper Qu <cooper.qu@linux.alibaba.com>, Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
	Huang Tao <eric.huang@linux.alibaba.com>, Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_042308_709256_CAFA4FBD 
X-CRM114-Status: GOOD (  48.84  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgNDo0M+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBDaHJpc3RvcGgsCj4KPiBPbiAyOC8wMy8yMDI0IDE1OjE4
LCBDaHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCAx
OjQx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
Pj4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTE6MDM6MDZBTSArMDAwMCwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+ID4+PiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCAxMTozMTozMEFNICswMTAwLCBD
aHJpc3RvcGggTcO8bGxuZXIgd3JvdGU6Cj4gPj4+PiBULUhlYWQncyBNQUVFIG1lY2hhbmlzbSAo
bm9uLWNvbXBhdGlibGUgZXF1aXZhbGVudCBvZiBSVkkncyBTdnBibXQpCj4gPj4+PiBpcyBjdXJy
ZW50bHkgYXNzdW1lZCBmb3IgYWxsIFQtSGVhZCBoYXJ0cy4gSG93ZXZlciwgUUVNVSByZWNlbnRs
eQo+ID4+Pj4gZGVjaWRlZCB0byBkcm9wIGFjY2VwdGFuY2Ugb2YgZ3Vlc3RzIHRoYXQgd3JpdGUg
cmVzZXJ2ZWQgYml0cyBpbiBQVEVzLgo+ID4+Pj4gQXMgTUFFRSB1c2VzIHJlc2VydmVkIGJpdHMg
aW4gUFRFcyBhbmQgTGludXggYXBwbGllcyB0aGUgTUFFRSBlcnJhdGEKPiA+Pj4+IGZvciBhbGwg
VC1IZWFkIGhhcnRzLCB0aGlzIGJyb2tlIHRoZSBMaW51eCBzdGFydHVwIG9uIFFFTVUgZW11bGF0
aW9ucwo+ID4+Pj4gb2YgdGhlIEM5MDYgZW11bGF0aW9uLgo+ID4+Pj4KPiA+Pj4+IFRoaXMgcGF0
Y2ggYXR0ZW1wdHMgdG8gYWRkcmVzcyB0aGlzIGlzc3VlIGJ5IHRlc3RpbmcgdGhlIE1BRUUgYml0
Cj4gPj4+PiBpbiBUSF9NWFNUQVRVUyBDU1IuIEFzIHRoZSBUSF9NWFNUQVRVUyBDU1IgaXMgb25s
eSBhY2Nlc3NpYmxlIGluIE0tbW9kZQo+ID4+Pj4gdGhpcyBwYXRjaCBkZXBlbmRzIG9uIE0tbW9k
ZSBmaXJtd2FyZSB0aGF0IGhhbmRsZXMgdGhpcyBmb3IgdXMKPiA+Pj4+IHRyYW5zcGFyZW50bHku
Cj4gPj4+Pgo+ID4+Pj4gQXMgdGhpcyBwYXRjaCBicmVha3MgTGludXggYm9vdHVwIG9uIGFsbCBD
OXh4IG1hY2hpbmVzIHdpdGggTUFFRSwKPiA+Pj4+IHdoaWNoIGRvbid0IGhhdmUgTS1tb2RlIGZp
cm13YXJlIHRoYXQgaGFuZGxlcyB0aGUgYWNjZXNzIHRvIHRoZQo+ID4+Pj4gVEhfTVhTVEFUVVMg
Q1NSLCB0aGlzIHBhdGNoIGlzIG1hcmtlZCBhcyBSRkMuCj4gPj4gQ2FuIHdlIHdyYXAgdGhlIGNz
ciBhY2Nlc3MgaW4gYSBfQVNNX0VYVEFCTEUoKT8gSWYgZmlybXdhcmUgaGFuZGxlcyBpdCwKPiA+
PiB0aGVuIHdlIHJldHVybiB0cnVlL2ZhbHNlIGJhc2VkIG9uIHRoZSB2YWx1ZS4gSWYgZmlybXdh
cmUgZG9lc24ndCBoYW5kbGUKPiA+PiBpdCwgYW5kIHdlIGdldCBhbiBpbGxlZ2FsIGluc3RydWN0
aW9uIGV4Y2VwdGlvbiwgdGhlbiB3ZSBhc3N1bWUgdGhlIGJpdAo+ID4+IGlzIHNldCwgd2hpY2gg
aXMgdGhlIGN1cnJlbnQgYmVoYXZpb3IuCj4gPj4KPiA+Pj4gSSB0aGluayB0aGlzIGlzIGdvbm5h
IGJlIHVuYWNjZXB0YWJsZSBpbiBpdHMgY3VycmVudCBzdGF0ZSBnaXZlbiB0aGF0IGl0Cj4gPj4+
IGNhdXNlcyBwcm9ibGVtcyBmb3IgZXZlcnkgb3RoZXIgdmVyc2lvbiBvZiB0aGUgZmlybXdhcmUu
IEJyZWFraW5nIHJlYWwKPiA+Pj4gc3lzdGVtcyBmb3IgdGhlIHNha2Ugb2YgZW11bGF0aW9uIGlz
bid0IHNvbWV0aGluZyB3ZSBjYW4gcmVhc29uYWJseSBkby4KPiA+Pj4KPiA+Pj4gVG8gbWFrZSB0
aGlzIHNvcnQgb2YgY2hhbmdlIGFjY2VwdGFibGUsIHlvdSdyZSBnb25uYSBoYXZlIHRvIGFkZCBz
b21lIHdheQo+ID4+PiB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gc3lzdGVtcyB0aGF0IGRvIGFu
ZCBkbyBub3Qgc3VwcG9ydCByZWFkaW5nIHRoaXMKPiA+Pj4gQ1NSLiBJIHRoaW5rIHdlIGVpdGhl
ciBhKSBuZWVkIHRvIGNoZWNrIHRoZSB2ZXJzaW9uIG9mIHRoZSBTQkkKPiA+Pj4gaW1wbGVtZW50
YXRpb24gdG8gc2VlIGlmIGl0IGhpdHMgdGhlIHRocmVzaG9sZCBmb3Igc3VwcG9ydGluZyB0aGlz
Cj4gPj4+IGZlYXR1cmUsIG9yIGIpIGFkZCBhIHNwZWNpZmljIFNCSSBjYWxsIGZvciB0aGlzIHNv
IHRoYXQgd2UgY2FuCj4gPj4+IGRpZmZlcmVudGlhdGUgYmV0d2VlbiBmaXJtd2FyZSBub3Qgc3Vw
cG9ydGluZyB0aGUgZnVuY3Rpb24gYW5kIHRoZQo+ID4+IFRoZSBGV0ZUIFNCSSBleHRlbnNpb24g
aXMgYmVpbmcgZGV2ZWxvcGVkIGFzIGEgbWVjaGFuaXNtIGZvciBTLW1vZGUgdG8gYXNrCj4gPj4g
TS1tb2RlIHRoaW5ncyBsaWtlIHRoaXMsIGJ1dCBJIHRoaW5rIHRoYXQgZXh0ZW5zaW9uIHNob3Vs
ZCBiZSB1c2VkIGZvcgo+ID4+IGZlYXR1cmVzIHRoYXQgaGF2ZSBwb3RlbnRpYWwgdG8gYmUgY2hh
bmdlZCBieSBTLW1vZGUgKGV2ZW4gaWYgbm90Cj4gPj4gZXZlcnl0aGluZyB3aWxsIGJlIGNoYW5n
ZWFibGUgb24gYWxsIHBsYXRmb3JtcyksIHdoZXJlYXMgYW55dGhpbmcgdGhhdCdzCj4gPj4gcmVh
ZC1vbmx5IHdvdWxkIGJlIGJldHRlciB3aXRoLi4uCj4gPj4KPiA+Pj4gcXVvdGUtdW5xdW90ZSAi
aGFyZHdhcmUiIG5vdCBzdXBwb3J0aW5nIGl0LiBJIGRvbid0IHJlYWxseSBsaWtlIG9wdGlvbiBh
KQo+ID4+PiBhcyBpdCBjb3VsZCBncm93IHRvIHNldmVyYWwgZGlmZmVyZW50IG9wdGlvbnMgKGVh
Y2ggZm9yIGEgZGlmZmVyZW50IFNCSQo+ID4+PiBpbXBsZW1lbnRhdGlvbikgYW5kIHN1cHBvcnQg
Zm9yIHJlYWRpbmcgdGhlIENTUiB3b3VsZCBuZWVkIHRvIGJlCj4gPj4+IHVuY29uZGl0aW9uYWwu
IEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCBJIGFtIG1pc3Npbmcgc29tZXRoaW5nIHRob3VnaCwKPiA+
Pj4gdGhhdCdkIG1ha2UgaXQgZG9hYmxlIHdpdGhvdXQgaW50cm9kdWNpbmcgYSBuZXcgY2FsbC4K
PiA+Pj4KPiA+Pj4gVGhhbmtzLAo+ID4+PiBDb25vci4KPiA+Pj4KPiA+Pj4gSWYgb25seSB3ZSdk
IG1hZGUgZW5hYmxpbmcgdGhpcyBiZSBjb250cm9sbGVkIGJ5IGEgc3BlY2lmaWMgRFQgcHJvcGVy
dHksCj4gPj4+IHRoZW4gZGlzYWJsaW5nIGl0IGluIFFFTVUgd291bGQgYmUgYXMgc2ltcGxlIGFz
IG5vdCBzZXR0aW5nIHRoYXQKPiA+Pj4gcHJvcGVydHkgOigKPiA+PiAuLi50aGlzLCB3aGVyZSAi
RFQgcHJvcGVydHkiIGlzICJJU0EgZXh0ZW5zaW9uIG5hbWUiLiBJIHdvbmRlciBpZiB3ZQo+ID4+
IHNob3VsZG4ndCBzdGFydCBjb25zaWRlcmluZyB0aGUgaW52ZW50aW9uIG9mIHhsaW51eF92ZW5k
b3JfeHl6IHR5cGUKPiA+PiBleHRlbnNpb24gbmFtZXMgd2hpY2ggZmlybXdhcmUgY291bGQgYWRk
IHRvIHRoZSBJU0Egc3RyaW5nIC8gYXJyYXksCj4gPj4gaW4gb3JkZXIgdG8gY29tbXVuaWNhdGUg
cmVhZC1vbmx5IGluZm9ybWF0aW9uIGxpa2UgdGhpcz8KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBk
cmV3Cj4gPiBIaSBDb25vciBhbmQgRHJldywKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgaGlu
dHMuCj4gPiBJIGZ1bGx5IGFncmVlIHdpdGggYWxsIHlvdXIgc3RhdGVtZW50cyBhbmQgY29uY2Vy
bnMuCj4gPgo+ID4gU3dpdGNoaW5nIGZyb20gdGgubXhzdGF0dXMgdG8gdGguc3hzdGF0dXMgc2hv
dWxkIGFkZHJlc3MgYWxsIG1lbnRpb25lZCBjb25jZXJuczoKPiA+ICogbm8gZGVwZW5kZW5jeSBv
biBPcGVuU0JJIGNoYW5nZXMKPiA+ICogbm8gYnJlYWsgb2YgZnVuY3Rpb25hbGl0eQo+ID4gKiBu
byBuZWVkIGZvciBncmFjZWZ1bCBoYW5kbGluZyBvZiBDU1IgcmVhZCBmYWlsdXJlcwo+ID4gKiBu
byBuZWVkIHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBIVyBhbmQgZW11bGF0aW9uIChhc3N1bWlu
ZyBRRU1VCj4gPiBhY2NlcHRzIHRoZSBlbXVsYXRpb24gb2YgdGguc3hzdGF0dXMpCj4gPgo+ID4g
QWxzbyBub3RlIHRoYXQgRFQgaGFuZGxpbmcgd291bGQgYmUgZGlmZmljdWx0LCBiZWNhdXNlIHdl
IG5lZWQgdG8gcHJvYmUgYmVmb3JlCj4gPiBzZXR0aW5nIHVwIHRoZSBwYWdlIHRhYmxlLgo+Cj4K
PiBXZSBhbHJlYWR5IHBhcnNlIHRoZSBEVCBiZWZvcmUgc2V0dGluZyB0aGUgcGFnZSB0YWJsZSB0
byBkaXNhYmxlIEtBU0xSCj4gYW5kIHRvIHBhcnNlICJubzRsdmwiIG9yICJubzVsdmwiIGNvbW1h
bmQgbGluZSBwYXJhbWV0ZXJzLiBUYWtlIGEgbG9vawo+IGF0IHRoZSBrZXJuZWwvcGkgZGlyZWN0
b3J5IGFuZCBzZXR1cF92bSgpIGluIG1tL2luaXQuYy4KCkFoLCBJIHNlZS4gU28sIHRoaXMgY2Fu
IGJlIGRvbmUgd2l0aCBhIGZ1bmN0aW9uIHNpbWlsYXIgdG8KZ2V0X2thc2xyX3NlZWQoKSBpbiBh
cmNoL3Jpc2N2L2tlcm5lbC9waS9mZHRfZWFybHkuYy4KQW5kIHRoZSBNYWtlZmlsZSB3aWxsIGFw
cGx5IHRoZSBuZWNlc3Nhcnkgc3RlcHMgdG8gZ2V0IHRoaXMgd29ya2luZy4KVGhlIGRvd25zaWRl
IGlzIHRoYXQgZGVwZW5kaW5nIG9uIG5ldyBpbmZvcm1hdGlvbiBpbiB0aGUgRFQsIGl0IHdpbGwg
bm90IGJlCmJhY2t3YXJkIGNvbXBhdGlibGUuIFNvLCBJIGRvbid0IHNlZSBhIHdheSBhcm91bmQg
cHJvYmluZyB0aC5zeHN0YXR1cy5NQUVFLgoKSW5kZXBlbmRlbnQgb2YgdGhhdCwgdGhlcmUgaXMg
d29yayB0byBiZSBkb25lIGZvciB0aGUgVC1IZWFkIGV4dGVuc2lvbgpkaXNjb3ZlcnkgaW4gdGhl
IExpbnV4IGtlcm5lbDoKKiBYVGhlYWQqIGV4dGVuc2lvbnMgYXJlIG5vdCBpbiB0aGUgRFRTCiog
WFRoZWFkKiBleHRlbnNpb25zIGFyZSBub3QgcGFyc2VkIGR1cmluZyBib290dXAKKiBYVGhlYWQq
IGV4dGVuc2lvbnMgZG9uJ3QgdHJpZ2dlciBvcHRpbWl6YXRpb25zIChzdHJpbmcgb3BzKSBvciBl
cnJhdGEgKE1BRUUpCiogWFRoZWFkKiBleHRlbnNpb25zIGFyZSBub3QgZXhwb3J0ZWQgdmlhIGh3
cHJvYmUKSG93ZXZlciwgSSB0aGluayB0aGlzIGlzIGluZGVwZW5kZW50IG9mIGFkZHJlc3Npbmcg
dGhlIE1BRUUgaXNzdWUuClNvLCBJIHdpbGwgc2VuZCBvdXQgYSBWMiB3aXRoIHRoZSB0aC5zeHN0
YXR1cy5NQUVFIHByb2Jpbmcgb25seS4KClRoYW5rcywKQ2hyaXN0b3BoCgo+Cj4gVGhhbmtzLAo+
Cj4gQWxleAo+Cj4KPiA+Cj4gPiBUaGFua3MhCj4gPgo+ID4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+ID4+Pj4g
LS0tCj4gPj4+PiAgIGFyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIHwgMTQgKysrKysr
KysrKy0tLS0KPiA+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3Ro
ZWFkL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+Pj4+IGlu
ZGV4IDhjOGE4YTRiMDQyMS4uZGQ3YmY2YzYyYTM1IDEwMDY0NAo+ID4+Pj4gLS0tIGEvYXJjaC9y
aXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRh
L3RoZWFkL2VycmF0YS5jCj4gPj4+PiBAQCAtMTksNiArMTksOSBAQAo+ID4+Pj4gICAjaW5jbHVk
ZSA8YXNtL3BhdGNoLmg+Cj4gPj4+PiAgICNpbmNsdWRlIDxhc20vdmVuZG9yaWRfbGlzdC5oPgo+
ID4+Pj4KPiA+Pj4+ICsjZGVmaW5lIENTUl9USF9NWFNUQVRVUyAgICAgICAgICAgIDB4N2MwCj4g
Pj4+PiArI2RlZmluZSBNWFNUQVRVU19NQUVFICAgICAgICAgICAgICBfQUMoMHgyMDAwMDAsIFVM
KQo+ID4+Pj4gKwo+ID4+Pj4gICBzdGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfbWFlZSh1bnNpZ25l
ZCBpbnQgc3RhZ2UsCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBs
b25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1waWQpCj4gPj4+PiAgIHsKPiA+Pj4+IEBAIC0y
OCwxMSArMzEsMTQgQEAgc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX21hZWUodW5zaWduZWQgaW50
IHN0YWdlLAo+ID4+Pj4gICAgICBpZiAoYXJjaF9pZCAhPSAwIHx8IGltcGlkICE9IDApCj4gPj4+
PiAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+Pj4KPiA+Pj4+IC0gICBpZiAoc3RhZ2Ug
PT0gUklTQ1ZfQUxURVJOQVRJVkVTX0VBUkxZX0JPT1QgfHwKPiA+Pj4+IC0gICAgICAgc3RhZ2Ug
PT0gUklTQ1ZfQUxURVJOQVRJVkVTX01PRFVMRSkKPiA+Pj4+IC0gICAgICAgICAgIHJldHVybiB0
cnVlOwo+ID4+Pj4gKyAgIGlmIChzdGFnZSAhPSBSSVNDVl9BTFRFUk5BVElWRVNfRUFSTFlfQk9P
VCAmJgo+ID4+Pj4gKyAgICAgICBzdGFnZSAhPSBSSVNDVl9BTFRFUk5BVElWRVNfTU9EVUxFKQo+
ID4+Pj4gKyAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+Pj4KPiA+Pj4+IC0gICByZXR1cm4g
ZmFsc2U7Cj4gPj4+PiArICAgaWYgKCEoY3NyX3JlYWQoQ1NSX1RIX01YU1RBVFVTKSAmIE1YU1RB
VFVTX01BRUUpKQo+ID4+Pj4gKyAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+Pj4gKwo+ID4+
Pj4gKyAgIHJldHVybiB0cnVlOwo+ID4+Pj4gICB9Cj4gPj4+Pgo+ID4+Pj4gICAvKgo+ID4+Pj4g
LS0KPiA+Pj4+IDIuNDQuMAo+ID4+Pj4KPiA+Pgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
