Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBAAC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiSf7WixdxYI/xN0+hSzOGXgvqFd9bNgh0ELud/L3X4=; b=mis9fiX8SqWB+w
	yTEqMR7svNMz0jm1TIOo57vlmknnznPfU1oeVcWOZmn6RChQ0R51fug46h3WgFdAf5L/qpvUS9DGV
	WxQcdvUoikJHg54p+86AKenQ0vKISRGc8Mf9Mrvt7tzxmieK5CwO/ojBeJahSlZo3xDJ9GUpwqniE
	9GQeAFJsksQmKdpaPu95xaRfUcEbzP/KkLgG7AtSi/11TKF3MjmOmCkDZ5lFhWcyQD8Xl103JmZQd
	3RRYQzdI2ROzXGOeJvwdZ2QV+mLTsLIyY77Hih6eYsxvGDSkPD60Z7lpYWmwNBfxITwJeneU2cxRI
	gcL1zpicLKATdqnnucUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODqf-00E0gL-T6; Wed, 17 Aug 2022 07:52:21 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oODqb-00E0Jn-CX
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 07:52:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id fy5so23137151ejc.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 00:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=9xnYZhI92vOXcy2182GQb2h4xwg4jFW98roz/a4SU/A=;
        b=OVPwHYg3PU3Z1vHpdZlisRprs3ZQd23oZMt25zzQvA4883qfh+RBwDVN4uFxDpTaUv
         C9qsgkYCkWb0MfWTlcBpvQFweh7783eLF5y3zqqy81zNnQTdg4Cab25HiRYJmiN6C6ok
         JGnbhrPNb7Rg6OqyjPSmWSpM0iWYPIO3pKTEYLdd0fcrh7bStP+8bYmsafeTgBBepmlr
         H+Xeclbhy9XWP3C+xEhX7ZVAh34Wn5RE8jEtmpe1EggGde3g5dh6XgxQW90RspH42+2X
         FqOEorEJUsZDPS3rn2nxh7PsEHKXv0SS/v2kcPOlBx/wI4mItc5nbxw4HB8lek5nkRG4
         3Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=9xnYZhI92vOXcy2182GQb2h4xwg4jFW98roz/a4SU/A=;
        b=4CTsxDJigmSReI2dxdY9bwlJW5SP0Npg9SUvrOLN0MQy5XpS3FLbGh2SCGtz0zraCn
         H81LIdusKEU/iULpy8RnWsjS2t32tng+RjUzKbre5hjgITSBORcQXewVKDWDvliRa3BS
         z8uAwn7FzmGik09eAnDndRZknMKU0uYx2Hus8di8leszbCx8lrHuGF/W5vSpef4BdvZs
         Tc6j2hmtKxd7I9d69VdKjOzJ7ZSM+lQcNkOPkOymJYDasufwpBFFC1Uow/+o7ook9q11
         LgVD5dIwI61vSxddl+inkeM+pe7YDKj4sl9AICUSuMtJDXwcSHzHaTwhNy6PN96Gw6+5
         EgmQ==
X-Gm-Message-State: ACgBeo3lMmTeFVSkHt8KkaJ2w+bHdQp53iHWwKHOrxB4Llpadbi2ju4H
	IZ1/S/QXfhCtaf6WlIUiphmcqw==
X-Google-Smtp-Source: AA6agR4ZX88kMxjHrS7fizpdk5LNncHR+I8re7ouM/1AQdHMVm8e+M7j2Vx1kRtOIyRqd7OBX7nsKA==
X-Received: by 2002:a17:907:b590:b0:730:9e0f:e9a3 with SMTP id qx16-20020a170907b59000b007309e0fe9a3mr15396358ejc.112.1660722729843;
        Wed, 17 Aug 2022 00:52:09 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id o6-20020aa7c506000000b0043e8334f762sm10030717edq.65.2022.08.17.00.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 00:52:08 -0700 (PDT)
Date: Wed, 17 Aug 2022 09:52:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: jrtc27@jrtc27.com, palmer@dabbelt.com, robh@kernel.org,
	tglx@linutronix.de, maz@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
	anup@brainfault.org, guoren@kernel.org, sagar.kadam@sifive.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Message-ID: <20220817075207.dvylesvqaoc7ga4r@kamzik>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
 <20220809141436.GA1706120-robh@kernel.org>
 <61829ccd-20d7-e2f0-0a6b-bcd0e076b9ea@microchip.com>
 <1d94e18d-7f51-0619-95a9-6ca5fa7d9671@microchip.com>
 <20220816140633.pkjws7n3qxsescjh@kamzik>
 <5abe9b30-274a-8f36-0797-cc0e981c3f70@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5abe9b30-274a-8f36-0797-cc0e981c3f70@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_005217_471786_8BB172BA 
X-CRM114-Status: GOOD (  42.67  )
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

T24gVHVlLCBBdWcgMTYsIDIwMjIgYXQgMTA6NTM6NDVQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb20gd3JvdGU6Cj4gSGV5IERyZXcsCj4gVGhhbmtzIGZvciBwaXBpbmcgdXAuCj4g
Cj4gT24gMTYvMDgvMjAyMiAxNTowNiwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gW1lvdSBkb24n
dCBvZnRlbiBnZXQgZW1haWwgZnJvbSBham9uZXNAdmVudGFuYW1pY3JvLmNvbS4gTGVhcm4gd2h5
IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVu
dGlmaWNhdGlvbiBdCj4gPiAKPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+
ID4gCj4gPiBPbiBNb24sIEF1ZyAxNSwgMjAyMiBhdCAwNzoxODowMlBNICswMDAwLCBDb25vci5E
b29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToKPiA+PiBBbnkgdGFrZXJzIG9uIHRyYXNoaW5nIG15
IHJlZ2V4PyBPdGhlcndpc2UgSSdsbCBqdXN0IHN1Ym1pdAo+ID4+IGEgdjIgd2l0aCB0aGUgcmVn
ZXggYW5kIGl0IGNhbiBiZSBzaGF0IG9uIHRoZXJlIGluc3RlYWQgOikKPiA+Pgo+ID4+IE9uIDA5
LzA4LzIwMjIgMTk6MzYsIENvbm9yIERvb2xleSB3cm90ZToKPiA+Pj4gT24gMDkvMDgvMjAyMiAx
NToxNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPj4+PiBPbiBNb24sIEF1ZyAwOCwgMjAyMiBhdCAx
MDowMToxMVBNICswMDAwLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToKPiA+Pj4+
PiBPbiAwOC8wOC8yMDIyIDIyOjM0LCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiA+Pj4+Pj4gT24g
RnJpLCBBdWcgMDUsIDIwMjIgYXQgMDU6Mjg6NDJQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3Rl
Ogo+ID4+Pj4+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KPiA+Pj4+Pj4+IFRoZSBmaW5hbCBwYXRjaCBhZGRzIHNvbWUgbmV3IElTQSBzdHJpbmdzCj4g
Pj4+Pj4+PiB3aGljaCBuZWVkcyBzY3J1aXRpbnkgZnJvbSBzb21lb25lIHdpdGggbW9yZSBrbm93
bGVkZ2UgYWJvdXQgd2hhdCBJU0EKPiA+Pj4+Pj4+IGV4dGVuc2lvbiBzdHJpbmdzIHNob3VsZCBi
ZSByZXBvcnRlZCBpbiBhIGR0IHRoYW4gSSBoYXZlLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBMaXN0aW5n
IGV2ZXJ5IHBvc3NpYmxlIElTQSBzdHJpbmcgc3VwcG9ydGVkIGJ5IHRoZSBMaW51eCBrZXJuZWwg
cmVhbGx5Cj4gPj4+Pj4+IGlzIG5vdCBnb2luZyB0byBzY2FsZS4uLgo+ID4+Pj4KPiA+Pj4+IEhv
dyBkb2VzIHRoZSBrZXJuZWwgc2NhbGU/IChObyBuZWVkIHRvIGFuc3dlcikKPiA+Pj4+Cj4gPj4+
Pj4gWWVhaCwgdG90YWxseSBjb3JyZWN0IHRoZXJlLiBDYXNlIGZvciBhZGRpbmcgYSByZWdleCBJ
IHN1cHBvc2UsIGJ1dCBJCj4gPj4+Pj4gYW0gbm90IHN1cmUgaG93IHRvIGdvIGFib3V0IGhhbmRs
aW5nIHRoZSBtdWx0aS1sZXR0ZXIgZXh0ZW5zaW9ucyBvcgo+ID4+Pj4+IGlmIHBhcnNpbmcgdGhl
bSBpcyByZXF1aXJlZCBmcm9tIGEgYmluZGluZyBjb21wbGlhbmNlIHBvaW50IG9mIHZpZXcuCj4g
Pj4+Pj4gSG9waW5nIGZvciBzb21lIGlucHV0IGZyb20gUGFsbWVyIHJlYWxseS4KPiA+Pj4+Cj4g
Pj4+PiBZZWFoLCBsb29rcyBsaWtlIGEgcmVnZXggcGF0dGVybiBpcyBuZWVkZWQuCj4gPj4+Cj4g
Pj4+IEkgc3RhcnRlZCBwb3R0ZXJpbmcgYXdheSBhdCB0aGlzIGJ1dCBJIGhhdmUgYXJyaXZlZCBh
dDoKPiA+Pj4gcnY2NGltYWY/ZD9jP2g/KF96W2ltYWZkcWNidmtoXShbYS16XSkqKSokCj4gPiAK
PiA+IERvbid0IGZvcmdldCB0aGUgXiBhdCB0aGUgc3RhcnQuCj4gPiAKPiA+IERvIHdlIG5lZWQg
dG8gd29ycnkgYWJvdXQgb3B0aW9uYWwgbWFqb3IgYW5kIG1pbm9yIHZlcnNpb24gbnVtYmVycz8K
PiA+IE9yIGNoZWNrIHRoYXQgWiBuYW1lcyBoYXZlIGF0IGxlYXN0IG9uZSBjaGFyYWN0ZXIgZm9s
bG93aW5nIHRoZSBjYXRlZ29yeQo+ID4gY2hhcmFjdGVyPyBBY3R1YWxseSwgdGhlIGZpcnN0IGxl
dHRlciBhZnRlciBaIGJlaW5nIGEgY2F0ZWdvcnkgaXMgb25seSBhCj4gPiBjb252ZW50aW9uLiBN
YXliZSB3ZSBkb24ndCB3YW50IHRvIGVuZm9yY2UgdGhhdC4gV2hhdCBhYm91dCBYIGV4dGVuc2lv
bnM/Cj4gCj4gRm9yIHRoZSBjaGFyYWN0ZXIgYWZ0ZXIgWiwgSSB0aGluayB3ZSBjb3VsZCBvcGVy
YXRlIG9uIHRoZSBhc3N1bXB0aW9uCj4gdGhhdCB0aGF0J3MgYSBjb252ZW50aW9uIHVudGlsIHRo
aW5ncyBjaGFuZ2UuIFRoZSByZWdleCBpc250IHNldCBpbgo+IHN0b25lIGZvcmV2ZXIuCj4gV2l0
aCB4LCBpdCBiZWNvbWVzIC0gd2hpY2ggdG8gbWUgbWFrZXMgYmFkIHdvcnNlOgo+IF5ydjY0aW1h
Zj9kP3E/Yz9iP3Y/az9oPyg/Oig/Ol96W2ltYWZkcWNidmtoXXxfeCkoPzpbYS16XSkqKSokCgpJ
IHRoaW5rIHdlIHNob3VsZCBjaGFuZ2UgdGhlIChbYS16XSopIHRvIChbYS16XSspLgoKPiAKPiBh
bmQgdGhlbiBmb3IgdGhlIHZlcnNpb24gbnVtYmVycyBpdCBiZWNvbWVzIGNvbXBsZXRlbHkgYXdm
dWwuCj4gSSdkIGFyZ3VlIHRoYXQgaWYgd2UgYXJlIGdvaW5nIHRvIHN1cHBvcnQgdGhvc2UsIHRo
ZW4gd2Ugc2hvdWxkCj4gZG8gdGhhdCBhcyBhbm90aGVyIHJlZ2V4LiBXZSBhcmUgYWxyZWFkeSBm
b3JjaW5nIGxvd2VyIGNhc2UgaW4KPiB0aGVzZSBJU0Egc3RyaW5ncyAtIGlzIHRoZXJlIGFuIGFj
dHVhbCBiZW5lZml0IGluIGFkZGluZyB0aGUKPiBudW1iZXJzLCBvciBtaWdodCB3ZSB3YW50IHRv
ICJlbmNvdXJhZ2UiIHJlbW92aW5nIHRob3NlIHRvbz8KPiAKPiBJIGhvcGUgSSBhbSBtaXNzaW5n
IHNvbWV0aGluZywgYXMgbXkgcmVnZXggZm9vIGlzbid0IHRoYXQgZ29vZCwgdG8KPiBlbmZvcmNl
IHRoZSBvcmRlcmluZyAmIHRoZSBudW1iZXJzIC0gZXZlbiBmb3IgdGhlIHNpbXBsZSBjYXNlIG9m
IHRoZQo+IG1ham9yIG51bWJlciBvbmx5LCB3ZSdkIG5lZWQgdG8gY29udmVydCAiZj8iIHRvICIo
PzpmXGQrKT8iIGFuZCBzbwo+IG9uIGZvciBldmVyeSBzaW5nbGUgZXh0ZW5zaW9uLiBJIGRvbid0
IHRoaW5rIHdlIHJlZHVjZSB0aGF0IGVpdGhlcgo+IGFzIHdlIHdhbnQgdG8gZW5mb3JjZSB0aGUg
b3JkZXJpbmcuCj4gCj4gRm9yIHRoZSBtaW5vciB2ZXJzaW9ucyBpdCBnb2VzIHRvICIoPzpmXGQr
cFxkKyk/Ii4gQXQgdGhhdCBwb2ludCBJCj4gZG9uJ3QgdGhpbmsgd2UgYXJlIGFkZGluZyBhbnkg
dmFsdWUgYnV0IHcvZSwgd2hvIGFtIEkgdG8gZGVjaWRlLgo+IFRoYXQgYmFsbG9vbmVkIG91dCB0
byAxOTQgY2hhcmFjdGVycyBmb3IgbWUuIEkgdGhlbiBkZWNpZGVkIHRvIGhhdmUKPiBhIGJpdCBv
ZiBmdW4sIGFuZCBqdXN0IGRvIGJvdGggbnVtYmVyIHNldHMgYXMgYSBvbmVsaW5lciwgdXNpbmcK
PiBzb21lIG5hbWVkIG1hdGNoIGdyb3Vwcy4gVGhhdCB3YXMgYWJvdXQgMjU1IGNoYXJhY3RlcnMu
IPCfmI0KPiBBbnl3YXksIGR0LXNjaGVtYSBoYWQgYSBwYW5pYyBhdHRhY2sgYXQgc29tZXRoaW5n
IEkgd2FzIGRvaW5nCj4gc28gSSB0aGluayB0aGF0IC9tYXkvIGJlIGEgYmFkIGlkZWEuCgpJIHBy
ZXN1bWUgaWYgYSB2ZXJzaW9uIGlzIHVzZWQgaXQgbWVhbnMgb25lIGNhbm5vdCByZWx5IG9uIHRo
ZSBkZWZhdWx0CnZlcnNpb24uIFNvIHdlIGNhbid0IGFsd2F5cyBlbmNvdXJhZ2UgdGhlbSB0byBi
ZSByZW1vdmVkLiBUbyBzaW1wbGlmeQp0aGluZ3Mgd2UgY2FuIGFsd2F5cyByZXF1aXJlIG1pbm9y
IG51bWJlcnMuIFdlIGNhbiBhbHNvIGFsd2F5cyByZXF1aXJlCnVuZGVyc2NvcmVzLiBTb21ldGhp
bmcgbGlrZQoKXnJ2NjRfaShcZCtwXGQrKT9fbVwxP19hXDE/KF9mXDE/KT8oX2RcMT8pPyAuLi4g
KChfeltpbWFmZHFjYnZraF18X3gpW2Etel0rXDE/KSokCgo+IAo+IEkgdm90ZSBmb3IgYWxsb3cg
dGhlIHggZXh0ZW5zaW9ucywga2VlcCB0aGUgY29udmVudGlvbiBmb3Igc3RhbmRhcmQKPiBleHRl
bnNpb25zICYgcmV2aXNpdCB0aGlzIGluIHRoZSBmdXR1cmUgaWYgbmVlZGVkLi4uCgpTb3VuZHMg
Z29vZC4gV2UgY2FuIGFsc28gZWFzaWx5IGFkZCBfc3xfaHxfenhtIHRvIHRoZSBPUiBpZiB3ZSB3
YW50LiBCdXQsCnRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIHRoZSBPUi4gQnkgdXNpbmcgaXQgd2Ug
ZG9uJ3QgZW5mb3JjZSBvcmRlci4gVG8gYmUKcGVkYW50aWMgd2Ugc2hvdWxkIGVuc3VyZSBfeiBj
b21lcyBiZWZvcmUgX3MsIHRoZW4gX2gsIHRoZW4gX3p4bSwgdGhlbiBfeC4KClRoYW5rcywKZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
