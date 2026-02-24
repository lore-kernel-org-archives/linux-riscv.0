Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5C3F5542B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 23:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE7I9jyV1X0/UMSdElh4XbNZitmdC4iiv24z/xEyy6g=; b=IhrtEJfqkd/+SX
	TbB3mK3U2ihL3y4MuP0iT4pbUY+FiXg2bYTb9/+GJPst2OL/NQB/2vLqTMWUQVMVwFouEMrzBEgiR
	ROrPqqO0CuOLtiA14ytj93b8jmmziKYHcFQkbRKW4QVZxcugPMo8owe+VLSlKIAQfU6dtHCQjV/4w
	HgTN5S13LrayDwB88BJhNUPUlcvxY7NpA9VtU8zWTrDyATDnUp8ZvTzeKV4cJ4Sh3KR08A3iOd8JE
	ZvCRXa/Wwv0DQPKB/QFrH4kFyslJJJwlih6qcg88QTW6xl4Fd0bkPaZbbjCC/36lFE9VGZot/sLU1
	m6b0pw+6SYD6aptrIfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1jH-00000002vrS-1CkK;
	Tue, 24 Feb 2026 23:22:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1jF-00000002vqi-0AW0
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 23:22:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OHMtTp057231
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfFAQiyZmVGFXLX8faUv5n41KksItq/B3W+StuEpf7A=; b=gl5dlejgjIteff9b
	7x7Pq19SfKbVV7z4qI8sB0mSLhNuVJpovMbFHDIZWMvezQhOahaxSBmrkRz9YL6Q
	ZlgV6yD7YLrxfnvfAkLN6MN6eVakCwbi5aPL91/TrKivsg6+pHihE1wPlWQjlGZT
	wOam6eQoQ/HwJGUgsZJH6rpQFPtjJEm6kP/EL88ymcdS1Q4Wrhi4J1q5Ldci8GL/
	hJao62AP9mNUerPfPZHa54hQI23GFuUOrbap7TTSfLYtnL3n3gWrq8LV3V5FoyXS
	ZLWC2MsKlWsoOifMTTdxOf51mJD3IIu50jGcG5mXrcM2MOU8LbQOj3ON0QGezU9S
	i1A1AA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9saahfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:22:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9ef13a4bso244156eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 15:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771975327; x=1772580127; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JfFAQiyZmVGFXLX8faUv5n41KksItq/B3W+StuEpf7A=;
        b=dj6lf3KXYcQhYefVtoyU6oGUNeUYtswwsxYOwx2P8B9C0PmaKY7JdVNSQTcTq/mXIG
         d6QXnyzDi25FsAUJnkc8ZNo3mdtzaJ/MARQEyFLYqxowc/CoTM41A6HFUC/BWriE/jHQ
         4Z8JljhfJS6mJ8wCUZsJ0+na2VP9lOAEpDMwohVmRZYtXPx0M0xDhFHdFi70Ex5PdJPI
         OElOU5n6Z6EzqmA0g/uZ/CF89GgC5fJwIaXAM/IOQczeD7B8k6glzoylh9nVSxkv+NH2
         GwEVP++mZt/O7tULmgzNxJJ3Iz8xQpkuZUW8VfgwnYpK9kxjJa1jbfd3cNiBEbSIuSOp
         yeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771975327; x=1772580127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfFAQiyZmVGFXLX8faUv5n41KksItq/B3W+StuEpf7A=;
        b=j4+j2cmerP1Jd+XBUa6veabPe5oXSMZotTbGtG3dke5Wou1ae2lpvGlULMeWGCuuPp
         Zdqp+moPfipAQoUZBv6yt2EJwZTihXN7zFlZ1r8zuxNGkj9TubEQv1OBkKOA3EiLUlWr
         bM4ji67LnuIP3oTisZQUMa/cpLBRjbYIBhj8X8ZzH7sqiz4qYPZN0ySLsBscnOJFzKD1
         K2l4SDQhwDrDL0MIHkCjm00QeUK7160aaESse9nvPvIBcMpjZ95XAnjBYvvQO7DsYOjo
         LUBkCvXQSB+je4uD7Wg/Zh7S2b2ljgIcGeIJPFb/F1yDPa6+aYGzprlfM8iVfvIxF7Dc
         vU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/A1/2njNShUQqbOLDtUB1g9b8LMOqZmTVVENwb3rBNjEkz3xKr9UdvLOIRLCNC/3aJ7pQGFgErsVk1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQpTyz8ZbZA4xGxKBzREBOet/kjVU5Xw/Z2nx8HKEXrhCNo3XC
	HwSxEqhrAqxf/ZI+NVkZNKXkI+7YAJNxhd7KMLgguYLPt3sxn8x4e3DX6sAyKkRXJxkORahiXXR
	Cx7JWD/0UApyo9U0sfjHOH1MCIW4wrjEu2XqEgzPewcgYKw7hBoGFlJ4KZxEYw4nv8UDiVKY=
X-Gm-Gg: AZuq6aIlhb7IVHgALRSxjKUmfeGyVq8Ftgj1k7Z6La65pbPJdTrmtesxhRFJHTLBgiZ
	dnx5GyyjNYAXq3pNAV1vcn+I9MPoeXTVMu24NwMqzOxkxssYS8XQTZYu4DM8T6MG/tGeysGU16n
	A3NdF7nhU/4c98CINv+hdFEFTERb9rHji1fetOxGuTCueDsios2QLuFBVLDkH6R33qSB+8fletF
	QViVHElvoj+LnOQ92ppGOQYKkzGmiw1ubelapYSokbELqsowtuQ9PTsocakqxZZKcONdh9fTAql
	DLAcVQN6jQGulrNLU6C4mmCRnWaBh6MZQWp3WPUC5VeXNtG4Xw8wYCTjrGzaGRvjsT0UlYp6HJX
	kTud/ufxuiewCqtyeE3Jc32qnDIZuq1s=
X-Received: by 2002:a05:7022:6087:b0:124:5760:1e18 with SMTP id a92af1059eb24-1277f522d78mr617960c88.14.1771975327417;
        Tue, 24 Feb 2026 15:22:07 -0800 (PST)
X-Received: by 2002:a05:7022:6087:b0:124:5760:1e18 with SMTP id a92af1059eb24-1277f522d78mr617952c88.14.1771975326866;
        Tue, 24 Feb 2026 15:22:06 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af10481sm12246389c88.3.2026.02.24.15.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:22:06 -0800 (PST)
Date: Tue, 24 Feb 2026 17:22:05 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 06/11] riscv: Add Ziccamoa, Ziccif, Ziccrse, and
 Za64rs to hwprobe
Message-ID: <kwzsqx5ja56pj3baz3vetqqwruje3arq776vtob6rwl2sn5jn2@lgo757sc435j>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-7-andrew.jones@oss.qualcomm.com>
 <CAH1PCMbNZC_VkNBKPHcFLRa5jh3naa_-EnER4_e5U99D054QXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMbNZC_VkNBKPHcFLRa5jh3naa_-EnER4_e5U99D054QXw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIwNiBTYWx0ZWRfX6RkxBIQZZSs/
 nwVaBt8YebwS24k9okQgH/iy2fx8Fl1wp6TlDsjfx6NQmVCW4mtXkbNaNY9DEQlhvHhw+eveVF4
 su4OVor8AIi46eu/Rr+H0UMeXPE6np5DqmaasWOrjl4aAoXKgTz9b0pz83Jpmquc3ZrmguNe2PN
 6Invf8AkQi/X+IIGK0UtRJJPyLKbOM38wsjIyHcjmgM1BwpN5lWEpzsiDjZeyEnR4awYne/FVeQ
 BKvoC3N6cO1L6RJnEw8cIuo0uxc+of8IPm06LixV4sBVuT+S/G3mgmdcMW6kLnvmmiE1Nr109O1
 8aR344JtIAnRs9h8YV82dMuI1gnDBZIo5YP0FhRoilTrf1XMoWXqb5QfS27ien4+mdNdPbu8ar+
 SjjGnfCyZYxnSa8Yq0uV1lIozLWqmO4qQLgumXV2RBhh//iMVRU9pF/OsnU/Fl/upmWWJZUGmk7
 270LNqZ5+v7rqsCVHdA==
X-Proofpoint-ORIG-GUID: iDLwjFVE0Wshxd9YKYe_QvOzGttX7urI
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699e32a0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RbRJnm8YtHrto4PCtmYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: iDLwjFVE0Wshxd9YKYe_QvOzGttX7urI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_152209_088010_0DB4B322 
X-CRM114-Status: GOOD (  25.75  )
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

T24gU2F0LCBGZWIgMjEsIDIwMjYgYXQgMDY6NTA6MjVQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBGcmksIEZlYiA2LCAyMDI2IGF0IDg6MjTigK9BTSBBbmRyZXcgSm9uZXMKPiA8YW5k
cmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4KPiA+IFppY2Nyc2UgaXMgYWxy
ZWFkeSBwcmVzZW50IGluIGNwdWZlYXR1cmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IEpvbmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4KPiA+IC0tLQo+ID4gIERvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCAxNiArKysrKysrKysrKysrKysrCj4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICB8ICAzICsrKwo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgNCArKysrCj4gPiAgYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICB8ICAzICsrKwo+ID4gIGFyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgfCAgNyArKysrKy0tCj4gPiAgNSBmaWxlcyBjaGFu
Z2VkLCAzMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+IGluZGV4IDQ0ODRmMmE3Zjc5OC4uOTcyMjZiN2M1OTM2
IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiA+IEBAIC0zOTUs
MyArMzk1LDE5IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiA+ICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzFgOiBBIGJpdG1hc2sgY29udGFpbmluZyBh
ZGRpdGlvbmFsCj4gPiAgICBleHRlbnNpb25zIHRoYXQgYXJlIGNvbXBhdGlibGUgd2l0aCB0aGUK
PiA+ICAgIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfSU1BYDogYmFzZSBz
eXN0ZW0gYmVoYXZpb3IuCj4gPiArCj4gPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VY
VF9aSUNDQU1PQWA6IFRoZSBaaWNjYW1vYSBleHRlbnNpb24gaXMgc3VwcG9ydGVkLAo+ID4gKyAg
ICBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgUHJvZmlsZXMgc3BlY2lmaWNhdGlvbiBzdGFydGlu
ZyBmcm9tIGNvbW1pdAo+ID4gKyAgICBiMWQ4MDY2MCAoIlVwZGF0ZWQgdG8gcmF0aWZpZWQgc3Rh
dGUuIikKPiA+ICsKPiA+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0NJRmA6
IFRoZSBaaWNjaWYgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwKPiA+ICsgICAgYXMgZGVmaW5lZCBp
biB0aGUgUklTQy1WIFByb2ZpbGVzIHNwZWNpZmljYXRpb24gc3RhcnRpbmcgZnJvbSBjb21taXQK
PiA+ICsgICAgYjFkODA2NjAgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4gPiArCj4g
PiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNDUlNFYDogVGhlIFppY2Nyc2Ug
ZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwKPiA+ICsgICAgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1W
IFByb2ZpbGVzIHNwZWNpZmljYXRpb24gc3RhcnRpbmcgZnJvbSBjb21taXQKPiA+ICsgICAgYjFk
ODA2NjAgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4gPiArCj4gPiArICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQTY0UlNgOiBUaGUgWmE2NHJzIGV4dGVuc2lvbiBpcyBz
dXBwb3J0ZWQsCj4gPiArICAgIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBQcm9maWxlcyBzcGVj
aWZpY2F0aW9uIHN0YXJ0aW5nIGZyb20gY29tbWl0Cj4gPiArICAgIGIxZDgwNjYwICgiVXBkYXRl
ZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4gaW5kZXgg
YzE3ZTExY2FjYTgzLi44ZTc2NGRiYzc0MTMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aAo+ID4gQEAgLTExMiw2ICsxMTIsOSBAQAo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUxT
RCAgICAgICAgICAgIDEwMgo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0xTRCAgICAgICAg
ICAgIDEwMwo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNDTFNNICAgICAgICAgIDEwNAo+
ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNDQU1PQSAgICAgICAgIDEwNQo+ID4gKyNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9aSUNDSUYgICAgICAgICAgIDEwNgo+ID4gKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aQTY0UlMgICAgICAgICAgIDEwNwo+ID4KPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfWExJTlVYRU5WQ0ZHICAgICAxMjcKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmgKPiA+IGluZGV4IDZhMDE2M2I1NDcxOC4uZmVkOWVhNmZkMmI1IDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+ID4gQEAgLTExNSw2ICsxMTUsMTAg
QEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+ID4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlf
VkVORE9SX0VYVF9NSVBTXzAgICAgMTQKPiA+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1pJ
Q0JPUF9CTE9DS19TSVpFICAgIDE1Cj4gPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9JTUFf
RVhUXzEgICAgICAgICAgICAxNgo+ID4gKyNkZWZpbmUgICAgICAgICAgICAgICAgUklTQ1ZfSFdQ
Uk9CRV9FWFRfWklDQ0FNT0EgICAgICAoMSA8PCAwKQo+ID4gKyNkZWZpbmUgICAgICAgICAgICAg
ICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQ0lGICAgICAgICAoMSA8PCAxKQo+ID4gKyNkZWZpbmUg
ICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQ1JTRSAgICAgICAoMSA8PCAyKQo+
ID4gKyNkZWZpbmUgICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWkE2NFJTICAgICAg
ICAoMSA8PCAzKQo+ID4gIC8qIEluY3JlYXNlIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSB3aGVuIGFk
ZGluZyBpdGVtcy4gKi8KPiA+Cj4gPiAgLyogRmxhZ3MgKi8KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKPiA+IGluZGV4IGNhN2EzNGY2NjczOC4uYjAwMWU3OGVlY2Y2IDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiA+IEBAIC00ODgsNiArNDg4LDggQEAgY29uc3Qgc3RydWN0IHJpc2N2
X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gPiAgICAgICAgIF9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVF9WQUxJREFURSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NLCByaXNj
dl94bGludXhlbnZjZmdfZXh0cywgcmlzY3ZfZXh0X3ppY2JvbV92YWxpZGF0ZSksCj4gPiAgICAg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHppY2JvcCwgUklTQ1ZfSVNBX0VYVF9a
SUNCT1AsIHJpc2N2X2V4dF96aWNib3BfdmFsaWRhdGUpLAo+ID4gICAgICAgICBfX1JJU0NWX0lT
QV9FWFRfU1VQRVJTRVRfVkFMSURBVEUoemljYm96LCBSSVNDVl9JU0FfRVhUX1pJQ0JPWiwgcmlz
Y3ZfeGxpbnV4ZW52Y2ZnX2V4dHMsIHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUpLAo+ID4gKyAg
ICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNjYW1vYSwgUklTQ1ZfSVNBX0VYVF9aSUNDQU1P
QSksCj4gCj4gSXQgbWlnaHQgYmUgZ29vZCB0byBhbHNvIGVuZm9yY2UgZXh0ZW5zaW9uIGRlcGVu
ZGVuY2llcyBoZXJlOgo+IFphNjRycyBkZXBlbmRzIG9uIFphbHJzYywgYW5kIFppY2NhbW9hIGRl
cGVuZHMgb24gWmFhbW8uCgpUaGVyZSdzIGNlcnRhaW5seSBhIHByYWN0aWNhbCAiZGVwZW5kZW5j
eSIuIFphNjRycyB3b3VsZG4ndCBtYWtlIG11Y2gKc2Vuc2UgdG8gc3VwcG9ydCB3aXRob3V0IGlu
c3RydWN0aW9ucyB0aGF0IG5lZWQgYSByZXNlcnZhdGlvbiBzZXQuIEFuZApzaW1pbGFybHkgWmlj
Y2Ftb2EgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2Ugd2l0aG91dCBaYWFtby4gSG93ZXZlciwgSSdt
IG5vdAphd2FyZSBvZiBhbnl0aGluZyB0aGF0IGV4cGxpY2l0bHkgc3RhdGVzIFppY2NhbW9hIGlt
cGxpZXMgWmFhbW8gb3IgWmE2NHJzCmltcGxpZXMgWmFscnNjLiBTbywgaW4gdGhlIGFic2VuY2Ug
b2YgYW55IHJ1bGVzLCBJIHZvdGUgd2UgbGVhdmUgdGhlbQppbmRlcGVuZGVudC4KClRoYW5rcywK
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
